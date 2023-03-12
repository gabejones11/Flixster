//
//  PosterScreen.swift
//  Flixster
//
//  Created by Gabe Jones on 3/10/23.
//

import UIKit

class PosterScreen: UIViewController {
    
    var movies: [Movie] = []
    
    //MARK: - UI Components
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PosterViewCell.self, forCellWithReuseIdentifier: PosterViewCell.identifier)
        collectionView.allowsSelection = true
        return collectionView
    }()
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "🎬 Posters 🎬"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        setupUI()
        
        //MARK: - Networking
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=c00c0f5d467060f179442b46db24a32a")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Network Error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print ("Data is nil")
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MovieResponse.self, from: data)
                let movie = response.results
                
                DispatchQueue.main.async {
                    self?.movies = movie
                    self?.collectionView.reloadData()
                }
                
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
    
    //MARK: - Setup UI
    func setupUI() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    //MARK: - View Did Layout Subviews
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumInteritemSpacing = 4
            layout.minimumLineSpacing = 4
            layout.scrollDirection = .vertical
            
            let numberOfColumns: CGFloat = 3
            let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
            layout.itemSize = CGSize(width: width, height: width * 1.5)
        }

}

//MARK: - Extension
extension PosterScreen: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movies.count)
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterViewCell.identifier, for: indexPath) as? PosterViewCell else{
            fatalError("Collection view could not load")
        }
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let detailMovieVC = DetailView()
        detailMovieVC.movie = selectedMovie
        navigationController?.pushViewController(detailMovieVC, animated: true)
    }
}
