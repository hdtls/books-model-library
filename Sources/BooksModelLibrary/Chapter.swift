import Foundation

public protocol ChapterModelProtocol: Model {
    var name: String { get set }
    var coverImage: ImageFile? { get set }
    var imageUrls: [ImageFile]? { get set }
}

public struct Chapter: ChapterModelProtocol {
    
    public var id: UInt64
    
    public var name: String
    
    public var coverImage: ImageFile?
    
    public var imageUrls: [ImageFile]?
    
    @inlinable
    public init() {
        id = .init()
        name = .init()
        coverImage = nil
        imageUrls = nil
    }
    
    public init(name: String, coverImage: ImageFile, imageUrls: [ImageFile]?) {
        self.id = .init()
        self.name = name
        self.coverImage = coverImage
        self.imageUrls = imageUrls
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Chapter: Identifiable {}
