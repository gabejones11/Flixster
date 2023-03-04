//
//  Movie.swift
//  Flixster
//
//  Created by Gabe Jones on 3/2/23.
//

import Foundation

//users can view the title, full description, backdrop image, vote average, vote count, popularity

struct Movie {
    let movieTitle: String
    let artWorkUrl100: URL
    let backdropImage: URL
    let description: String
    let voteAverage: String
    let voteCount: String
    let popularity: String
}

extension Movie {
    static var mockMovies: [Movie] = [
        Movie(movieTitle: "M3GAN", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg")!, description: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.", voteAverage: "7.5 Vote Average", voteCount: "1844 Votes", popularity: "1117.0 Popularity"),
        
        Movie(movieTitle: "Puss in Boots: The Last Wish", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/b1Y8SUb12gPHCSSSNlbX4nB3IKy.jpg")!, description: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.", voteAverage: "8.4 Vote Average", voteCount: "4159 Votes", popularity: "2311.8 Popularity"),
        
        Movie(movieTitle: "Ant-Man and the Wasp: Quantumania", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/3JSoB7eMbCd8sE8alxNiUtrNiTz.jpg")!, description: "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.", voteAverage: "6.5 Vote Average", voteCount: "819 Votes", popularity: "1001.2 Popularity"),
        
        Movie(movieTitle: "Knock at the Cabin", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/22z44LPkMyf5nyyXvv8qQLsbom.jpg")!, description: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.", voteAverage: "6.5 Vote Average", voteCount: "670 Votes", popularity: "4112.6 Popularity"),
        
        Movie(movieTitle: "Black Panther: Wakanda Forever", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg")!, description: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.", voteAverage: "7.4 Vote Average", voteCount: "3708 Votes", popularity: "2678.5 Popularity"),
        
        Movie(movieTitle: "Plane", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/9Rq14Eyrf7Tu1xk0Pl7VcNbNh1n.jpg")!, description: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.", voteAverage: "6.9 Vote Average", voteCount: "717 Votes", popularity: "2001.9 Popularity"),
        
        Movie (movieTitle: "Little Dixie", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/cmWTZj9zzT9KFt3XyL0gssL7Ig8.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/k4V6EvpcOsu8CX10JD0H53lFXLq.jpg")!, description: "Erstwhile Special Forces operative Doc Alexander is asked to broker a truce with the Mexican drug cartel in secrecy. When Oklahoma Governor Richard Jeffs celebrates the execution of a high-ranking cartel member on TV, his Chief of Staff and Doc inform him about the peace he just ended. But it’s too late, as Cuco, the cartel’s hatchet man, has set his vengeful sights on Doc’s daughter Dixie.", voteAverage: "6.2 Vote Average", voteCount: "33 Votes", popularity: "1538.5 Popularity"),
        
        Movie(movieTitle: "Huesera", artWorkUrl100: URL(string: "https://image.tmdb.org/t/p/w500/1mZcxuL4GLUvPdEXC4iZPjG2EO3.jpg")!, backdropImage: URL(string: "https://image.tmdb.org/t/p/w500/A2avUoNFstnBhAnHiogXQs4c9Bt.jpg")!, description: "Valeria's joy at becoming a first-time mother is quickly taken away when she's cursed by a sinister entity. As danger closes in, she's forced deeper into a chilling world of dark magic that threatens to consume her.", voteAverage: "6.6 Vote Average", voteCount: "40 Votes", popularity: "1514.4 Popularity")
    ]
}
