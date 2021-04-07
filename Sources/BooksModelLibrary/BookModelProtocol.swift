import Foundation

#if !canImport(Vapor)
public protocol Model: Hashable, Codable {
    
    init()
}
#endif

public protocol BookModelProtocol: Model {
    
    associatedtype Artwork: ArtworkModelProtocol
    associatedtype Artist: ArtistModelProtocol
    associatedtype Category: CategoryModelProtocol
    associatedtype Series: SeriesModelProtocol
    
    var id: String { get }
    var name: String { get }
    var aliases: [String]? { get }
    var summary: String? { get }
    var coverArt: Artwork { get }
    var backgroundArt: Artwork? { get }
    var releaseDate: String { get }
    var artists: [Artist] { get }
    var categories: [Category] { get }
    var series: Series? { get }
}

public struct Book: BookModelProtocol {
    
    public let id: String

    public let name: String
                        
    public let aliases: [String]?
    
    public let summary: String?

    public let coverArt: Artwork
    
    public let backgroundArt: Artwork?
            
    public let releaseDate: String
    
    public let artists: [Artist]
    
    public let categories: [Category]
    
    public let series: Series?
    
    public init(
        id: String = UUID().uuidString,
        name: String,
        aliases: [String]? = nil,
        summary: String?,
        coverArt: Artwork,
        backgroundArt: Artwork? = nil,
        releaseDate: String,
        artists: [Artist],
        categories: [Category],
        series: Series? = nil
    ) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.summary = summary
        self.coverArt = coverArt
        self.backgroundArt = backgroundArt
        self.releaseDate = releaseDate
        self.artists = artists
        self.categories = categories
        self.series = series
    }
    
    @inlinable
    public init() {
        id = UUID.init().uuidString
        name = ""
        aliases = nil
        summary = nil
        coverArt = .init()
        backgroundArt = nil
        releaseDate = ""
        artists = []
        categories = []
        series = nil
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Book: Identifiable {}
