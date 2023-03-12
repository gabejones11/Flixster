//
//  CollectionViewCell.swift
//  Flixster
//
//  Created by Gabe Jones on 3/10/23.
//

import UIKit
import Nuke

class PosterViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    //MARK: - UI Components
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configuration
    func configure(with movie: Movie) {
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie.poster_path.absoluteString
        let imagePath = baseURL + posterPath
        let imageURL = URL(string: imagePath)
        Nuke.loadImage(with: imageURL!, into: posterImageView)
        
    }
    
    //MARK: - Setup UI
    func setupUI() {
        contentView.addSubview(posterImageView)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
}

