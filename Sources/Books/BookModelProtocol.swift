import Foundation

public protocol Model: Identifiable, Hashable, Codable {}

public protocol BookModelProtocol: Model {
    associatedtype Artwork: ArtworkModelProtocol
    associatedtype Artist: ArtistModelProtocol
    associatedtype Genre: GenreModelProtocol
    associatedtype Series: SeriesModelProtocol
    
    var name: String { get }
    var coverArt: Artwork { get }
    var backgroundArt: Artwork? { get }
    var releaseDate: Date { get }
    var artists: [Artist] { get }
    var genres: [Genre] { get }
    var series: Series { get }
}


public struct Book: BookModelProtocol {
    public let id: UUID

    public let name: String
                        
    public let coverArt: Artwork
    
    public let backgroundArt: Artwork?
            
    public let releaseDate: Date
    
    public let artists: [Artist]
    
    public let genres: [Genre]
    
    public let series: Series

    public init(
        id: UUID = .init(),
        name: String,
        coverArt: Artwork,
        backgroundArt: Artwork? = nil,
        releaseDate: Date,
        artists: [Artist],
        genres: [Genre],
        series: Series
    ) {
        self.id = id
        self.name = name
        self.coverArt = coverArt
        self.backgroundArt = backgroundArt
        self.releaseDate = releaseDate
        self.artists = artists
        self.genres = genres
        self.series = series
    }
}
