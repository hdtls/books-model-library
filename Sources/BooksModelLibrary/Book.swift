import Foundation

public protocol Model: Hashable, Codable {
    
    init()
}

public protocol BookModelProtocol: Model {
    
    associatedtype Image: ImageModelProtocol
    associatedtype Author: AuthorModelProtocol
    associatedtype Category: CategoryModelProtocol
    
    var id: String { get set }
    var name: String { get set }
    var aliases: [String]? { get set }
    var coverImage: Image { get set }
    var excerpt: String { get set }
    var backgroundImage: Image? { get set }
    var promoImage: Image? { get set }
    var authors: [Author] { get set }
    var schedule: Int { get set }
    var copyrighted: Bool { get set }
    var categories: [Category] { get set }
    var chapters: [Chapter]? { get set }
    var area: Area? { get set }
}

public struct Book: BookModelProtocol {
    
    public var id: String

    public var name: String
                        
    public var aliases: [String]?
    
    public var excerpt: String

    public var coverImage: ImageFile
    
    public var backgroundImage: ImageFile?
    
    public var promoImage: ImageFile?
    
    public var schedule: Int
    
    public var copyrighted: Bool
                
    public var authors: [Author]
    
    public var categories: [Category]
    
    public var chapters: [Chapter]?
    
    public var area: Area?
        
    public init(
        id: String = UUID().uuidString,
        name: String,
        aliases: [String]? = nil,
        excerpt: String,
        coverImage: ImageFile,
        backgroundImage: ImageFile? = nil,
        promoImage: ImageFile? = nil,
        schedule: Int = 0,
        copyrighted: Bool = false,
        authors: [Author],
        categories: [Category],
        chapters: [Chapter]? = nil,
        area: Area? = nil
    ) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.excerpt = excerpt
        self.coverImage = coverImage
        self.backgroundImage = backgroundImage
        self.promoImage = promoImage
        self.schedule = schedule
        self.copyrighted = copyrighted
        self.authors = authors
        self.categories = categories
        self.chapters = chapters
        self.area = area
    }
    
    @inlinable
    public init() {
        id = UUID.init().uuidString
        name = .init()
        aliases = nil
        excerpt = .init()
        coverImage = .init()
        backgroundImage = nil
        promoImage = nil
        schedule = 0
        copyrighted = false
        authors = []
        categories = []
        chapters = nil
        area = nil
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Book: Identifiable {}
