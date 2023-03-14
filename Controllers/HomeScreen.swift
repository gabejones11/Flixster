//
//  ViewController.swift
//  Flixster
//
//  Created by Gabe Jones on 3/2/23.
//

import UIKit

class HomeScreen: UIViewController {
    
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
        navigationItem.title = "🎥 Movies 🎥"
        
        // MARK: - Networking
        //Create a URL for the request
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=c00c0f5d467060f179442b46db24a32a")!
        
        //Use the URL to instantiate a request
        let request = URLRequest(url: url)
        
        //Create URLSession using a shared instance and call the dataTask method
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            //handle network errors
            if let error = error {
                print("Network Error: \(error.localizedDescription)")
            }
            
            //Make sure that we have the data
            guard let data = data else {
                print ("Data is nil")
                return
            }
            
            //use JSONSerialization class to deserialize the JSON data returned by the server if error occurs catch it
            do {
                // Create a JSON Decoder
                let decoder = JSONDecoder()

                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(MovieResponse.self, from: data)

                // Access the array of tracks from the `results` property
                let movies = response.results
                
                // Execute UI updates on the main thread when calling from a background callback
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    self?.movies = movies

                    // Make the table view reload now that we have new data
                    self?.tableView.reloadData()
                }
                
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
            
        }
        //Initiate the network request
        task.resume()
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
extension HomeScreen: UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate {
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
        let selectedMovie = movies[indexPath.row]
        let detailMovieVC = DetailView()
        detailMovieVC.movie = selectedMovie
        navigationController?.pushViewController(detailMovieVC, animated: true)
    }
}
