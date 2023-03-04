//
//  ViewController.swift
//  Flixster
//
//  Created by Gabe Jones on 3/2/23.
//

import UIKit

class FirstScreen: UIViewController {
    
    var movies: [Movie] = []
    
    // MARK: - UI Components
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        movies = Movie.mockMovies
        navigationItem.title = "Movies"
        
    }
    
    // MARK: - Setup UI
    func setupUI(){
        view.addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

    // MARK: - Extension
extension FirstScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else{
            fatalError("Table View could not load")
        }

        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        cell.backgroundColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = Movie.mockMovies[indexPath.row]
        let detailMovieVC = SecondScreen()
        detailMovieVC.movie = selectedMovie
        navigationController?.pushViewController(detailMovieVC, animated: true)
    }
}
