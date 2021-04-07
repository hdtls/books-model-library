import Foundation

public protocol Model: Hashable, Codable {
    
    init()
}

public protocol BookModelProtocol: Model {
    
    associatedtype Image: ImageModelProtocol
    associatedtype Author: AuthorModelProtocol
    associatedtype Category: CategoryModelProtocol
    
    var id: String { get }
    var name: String { get }
    var aliases: [String]? { get }
    var coverImage: Image { get }
    var excerpt: String? { get }
    var backgroundImage: Image? { get }
    var authors: [Author] { get }
    var schedule: Int { get }
    var copyrighted: Bool { get }
    var categories: [Category] { get }
}

public struct Book: BookModelProtocol {
    
    public let id: String

    public let name: String
                        
    public let aliases: [String]?
    
    public let excerpt: String?

    public let coverImage: ImageFile
    
    public let backgroundImage: ImageFile?
    
    public let schedule: Int
    
    public let copyrighted: Bool
                
    public let authors: [Author]
    
    public let categories: [Category]
        
    public init(
        id: String = UUID().uuidString,
        name: String,
        aliases: [String]? = nil,
        excerpt: String?,
        coverImage: ImageFile,
        backgroundImage: ImageFile? = nil,
        schedule: Int = 0,
        copyrighted: Bool = false,
        authors: [Author],
        categories: [Category]
    ) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.excerpt = excerpt
        self.coverImage = coverImage
        self.backgroundImage = backgroundImage
        self.schedule = schedule
        self.copyrighted = copyrighted
        self.authors = authors
        self.categories = categories
    }
    
    @inlinable
    public init() {
        id = UUID.init().uuidString
        name = ""
        aliases = nil
        excerpt = nil
        coverImage = .init()
        backgroundImage = nil
        schedule = 0
        copyrighted = false
        authors = []
        categories = []
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Book: Identifiable {}
