import Foundation

public protocol Model: Hashable, Codable {
    
    init()
}

public protocol BookModelProtocol: Model {
    
    associatedtype Image: ImageModelProtocol
    associatedtype Author: AuthorModelProtocol
    associatedtype Category: CategoryModelProtocol
    
    var id: UInt64 { get set }
    var name: String { get set }
    var aliases: [String]? { get set }
    var coverImage: Image { get set }
    var excerpt: String? { get set }
    var backgroundImage: Image? { get set }
    var promoImage: Image? { get set }
    var authors: [Author] { get set }
    var schedule: Int { get set }
    var copyrighted: Bool { get set }
    var categories: [Category] { get set }
    var chapters: [Chapter]? { get set }
    var area: Area? { get set }
    var areaId: UInt64? { get set }
}

public struct Book: BookModelProtocol {
    
    public var id: UInt64

    public var name: String
                        
    public var aliases: [String]?
    
    public var excerpt: String?
    
    public var coverImage: ImageFile
    
    public var backgroundImage: ImageFile?
    
    public var promoImage: ImageFile?
    
    public var schedule: Int
    
    public var copyrighted: Bool
                
    public var authors: [User]
    
    public var categories: [Category]
    
    public var chapters: [Chapter]?
    
    public var area: Area?
    
    public var areaId: UInt64?
        
    public init(
        id: UInt64,
        name: String,
        aliases: [String]? = nil,
        excerpt: String,
        coverImage: ImageFile,
        backgroundImage: ImageFile? = nil,
        promoImage: ImageFile? = nil,
        schedule: Int = 0,
        copyrighted: Bool = false,
        authors: [User],
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
        self.areaId = area?.id
    }
    
    @inlinable
    public init() {
        id = .init()
        name = .init()
        aliases = nil
        excerpt = .init()
        coverImage = .init()
        backgroundImage = nil
        promoImage = nil
        schedule = .init()
        copyrighted = false
        authors = []
        categories = []
        chapters = nil
        area = nil
        areaId = nil
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Book: Identifiable {}
