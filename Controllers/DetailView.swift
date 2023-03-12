//
//  SecondScreen.swift
//  Flixster
//
//  Created by Gabe Jones on 3/3/23.
//

import UIKit
import Nuke

class DetailView: UIViewController {
    
    var movie: Movie!
    
    // MARK: - UIComponents
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 20
        return label
    }()
    
    let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    let voteCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    let popularityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center

        return label
    }()
    
    let backdropImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        return scrollView
    }()

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()

    }
    
    // MARK: - Setup UI
    func setupUI(){
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let backdropPath = movie.backdrop_path.absoluteString
        let imagePath = baseURL + backdropPath
        let imageURL = URL(string: imagePath)
        Nuke.loadImage(with: imageURL!, into: backdropImage)
        movieTitleLabel.text = movie.original_title
        descriptionLabel.text = movie.overview
        voteAverageLabel.text = "Vote average 👌🏼:  " + String(movie.vote_average.rounded())
        voteCountLabel.text = "Vote Count 💯:  " + String(movie.vote_count)
        popularityLabel.text = "Popularity 💁🏻‍♀️:  " + String(movie.popularity.rounded())
        
        view.addSubview(scrollView)
        scrollView.addSubview(backdropImage)
        scrollView.addSubview(movieTitleLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(voteAverageLabel)
        scrollView.addSubview(voteCountLabel)
        scrollView.addSubview(popularityLabel)

        backdropImage.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        voteCountLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backdropImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backdropImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backdropImage.widthAnchor.constraint(equalToConstant: 400),
            backdropImage.heightAnchor.constraint(equalToConstant: 200),
            
            movieTitleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            movieTitleLabel.topAnchor.constraint(equalTo: backdropImage.bottomAnchor, constant: 10),
            
            voteAverageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            voteAverageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            voteAverageLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 30),
            
            voteCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            voteCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            voteCountLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 10),
            
            popularityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            popularityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            popularityLabel.topAnchor.constraint(equalTo: voteCountLabel.bottomAnchor, constant: 10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            descriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 30)
        ])
    }
    
    // MARK: - View Rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if UIDevice.current.orientation.isLandscape{
            scrollView.contentSize = CGSize(width: size.width, height: size.height * 1.5)
        } else {
            scrollView.contentSize = CGSize(width: size.width, height: descriptionLabel.frame.maxY + 20)
        }
    }
}
