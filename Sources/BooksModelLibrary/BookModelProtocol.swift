import Foundation

public protocol Model: Hashable, Codable {
    
    init()
}

public protocol BookModelProtocol: Model {
    
    associatedtype Artwork: ArtworkModelProtocol
    associatedtype Artist: ArtistModelProtocol
    associatedtype Genre: GenreModelProtocol
    associatedtype Series: SeriesModelProtocol
    
    var id: String { get }
    var name: String { get }
    var alias: String? { get }
    var summary: String? { get }
    var coverArt: Artwork { get }
    var backgroundArt: Artwork? { get }
    var releaseDate: String { get }
    var artists: [Artist] { get }
    var genres: [Genre] { get }
    var series: Series? { get }
}

public struct Book: BookModelProtocol {
    
    public let id: String

    public let name: String
                        
    public let alias: String?
    
    public let summary: String?

    public let coverArt: Artwork
    
    public let backgroundArt: Artwork?
            
    public let releaseDate: String
    
    public let artists: [Artist]
    
    public let genres: [Genre]
    
    public let series: Series?
    
    public init(
        id: String = UUID().uuidString,
        name: String,
        alias: String? = nil,
        summary: String?,
        coverArt: Artwork,
        backgroundArt: Artwork? = nil,
        releaseDate: String,
        artists: [Artist],
        genres: [Genre],
        series: Series? = nil
    ) {
        self.id = id
        self.name = name
        self.alias = alias
        self.summary = summary
        self.coverArt = coverArt
        self.backgroundArt = backgroundArt
        self.releaseDate = releaseDate
        self.artists = artists
        self.genres = genres
        self.series = series
    }
    
    @inlinable
    public init() {
        id = UUID.init().uuidString
        name = ""
        alias = nil
        summary = nil
        coverArt = .init()
        backgroundArt = nil
        releaseDate = ""
        artists = []
        genres = []
        series = nil
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Book: Identifiable {}
