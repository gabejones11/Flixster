//
//  CustomCell.swift
//  Flixster
//
//  Created by Gabe Jones on 3/2/23.
//

import UIKit
import Nuke

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    // MARK: - UI Components
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 3
        return label
    }()
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure(with movie: Movie){
        movieNameLabel.text = movie.original_title
        descriptionLabel.text = movie.overview
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie.poster_path.absoluteString
        let imagePath = baseURL + posterPath
        let imageURL = URL(string: imagePath)
        Nuke.loadImage(with: imageURL!, into: movieImageView)
        
    }
    
    // MARK: - Setup UI
    func setupUI() {
        
        contentView.addSubview(movieImageView)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(descriptionLabel)
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 65),
            movieImageView.heightAnchor.constraint(equalToConstant: 80),
            
            movieNameLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor),
            movieNameLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)

        ])
    }

}
