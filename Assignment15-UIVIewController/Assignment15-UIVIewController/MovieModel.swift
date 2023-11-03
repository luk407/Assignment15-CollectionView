
import Foundation
import UIKit

enum MovieGenre: String {
    case action = "Action"
    case adventure = "Adventure"
    case horror = "Horror"
    case comedy = "Comedy"
}

enum MovieCertificate: String {
    case kids = "6+"
    case teens = "12+"
    case olderTeens = "16+" //creativity :)
    case adults = "18+"
}

final class Movie {
    let name: String
    let genre: MovieGenre
    let image: UIImage
    let imageFromMovie: UIImage
    let rating: Double
    var isFavourite: Bool?
    let certificate: MovieCertificate
    let runtime: String
    let director: String
    let cast: String
    let release: String
    let about: String
    
    init(name: String, genre: MovieGenre, image: UIImage, imageFromMovie: UIImage, rating: Double, isFavourite: Bool? = nil, certificate: MovieCertificate, runtime: String, director: String, cast: String, release: String, about: String) {
        self.name = name
        self.genre = genre
        self.image = image
        self.imageFromMovie = imageFromMovie
        self.rating = rating
        self.isFavourite = isFavourite
        self.certificate = certificate
        self.runtime = runtime
        self.director = director
        self.cast = cast
        self.release = release
        self.about = about
    }
    
    static let dummyData = [
        Movie(
            name: "The Batman",
            genre: .action,
            image: UIImage(named: "batman")!,
            imageFromMovie: UIImage(named: "batman1")!,
            rating: 8.1,
            certificate: .olderTeens,
            runtime: "2:56",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, Andy Serkis, Peter Sarsgaard",
            release: "2022",
            about: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement."),
        
        Movie(name: "Uncharted",
              genre: .adventure,
              image: UIImage(named: "uncharted")!,
              imageFromMovie: UIImage(named: "uncharted1")!,
              rating: 7.9,
              certificate: .olderTeens,
              runtime: "1:56",
              director: "Ruben Fleischer",
              cast: "Tom Holland, Mark Wahlberg, Sophia Ali, Tati Gabrielle, Antonio Bandera",
              release: "2022",
              about: "Street-smart Nathan Drake is recruited by seasoned treasure hunter Victor \"Sully\" Sullivan to recover a fortune amassed by Ferdinand Magellan, and lost 500 years ago by the House of Moncada."),
        
        Movie(name: "The Exorcism of God", 
              genre: .horror,
              image: UIImage(named: "exorcism")!,
              imageFromMovie: UIImage(named: "exorcism1")!,
              rating: 5.6,
              certificate: .olderTeens,
              runtime: "1:38",
              director: "Alejandro Hidalgo",
              cast: "Will Beinbrik, María Gabriela de Faría, Joseph Marcell",
              release: "2021",
              about: "An American priest working in Mexico is possessed during an exorcism and ends up committing a terrible act. Eighteen years later, the consequences of his sin come back to haunt him, unleashing the greatest battle within."),
        
        Movie(name: "Turning Red", 
              genre: .comedy,
              image: UIImage(named: "red")!,
              imageFromMovie: UIImage(named: "red1")!,
              rating: 7.1,
              certificate: .olderTeens,
              runtime: "1:40",
              director: "Domee Shi",
              cast: "Rosalie Chiang, Sandra Oh, Ava Morse, Hyein Park, Maitreyi Ramakrishnan, Orion Lee, Wai Ching Ho, Tristan Allerick Chen, James Hong",
              release: "2022",
              about: "A thirteen-year-old girl named Mei Lee is torn between staying her mother's dutiful daughter and the changes of adolescence. And as if the challenges were not enough, whenever she gets overly excited she transforms into a giant red panda."),
        
        Movie(name: "Spider-Man: No Way Home", 
              genre: .action,
              image: UIImage(named: "spider")!,
              imageFromMovie: UIImage(named: "spider1")!,
              rating: 8.1,
              certificate: .olderTeens,
              runtime: "2:28",
              director: "Jon Watts",
              cast: "Tom Holland, Zendaya, Benedict Cumberbatch, Jacob Batalon, Jon Favreau, Jamie Foxx, Willem Dafoe, Alfred Molina, Benedict Wong, Tony Revolori, Marisa Tomei, Andrew Garfield, Tobey Maguire",
              release: "2021",
              about: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man."),
        
        Movie(name: "Morbius", 
              genre: .action,
              image: UIImage(named: "morbius")!,
              imageFromMovie: UIImage(named: "morbius1")!,
              rating: 5.3,
              certificate: .olderTeens,
              runtime: "1:44",
              director: "Daniel Espinosa",
              cast: "Jared Leto, Matt Smith, Adria Arjona, Jared Harris, Al Madrigal, Tyrese Gibson",
              release: "2022",
              about: "Biochemist Michael Morbius tries to cure himself of a rare blood disease, but he inadvertently infects himself with a form of vampirism instead."),
    ]
}
