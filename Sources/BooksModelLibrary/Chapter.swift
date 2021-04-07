import Foundation

public protocol ChapterModelProtocol: Model {
    var name: String { get set }
    var imageUrls: [ImageFile]? { get set }
}

public struct Chapter: ChapterModelProtocol {
    
    public var id: String
    
    public var name: String
    
    public var imageUrls: [ImageFile]?
    
    @inlinable
    public init() {
        id = UUID().uuidString
        name = .init()
        imageUrls = nil
    }
    
    public init(name: String, imageUrls: [ImageFile]?) {
        self.id = UUID().uuidString
        self.name = name
        self.imageUrls = imageUrls
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Chapter: Identifiable {}
