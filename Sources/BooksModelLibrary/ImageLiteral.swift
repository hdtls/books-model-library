import Foundation

public struct ImageLiteral: Model {
    
    public var id: UInt64
    
    public var imageUrls: [ImageFile]
    
    public init() {
        id = .init()
        imageUrls = .init()
    }
}

