import Foundation

public protocol ImageModelProtocol: Model {
    var width: Int { get }
    var height: Int { get }
    var url: String { get }
}

public struct ImageFile: ImageModelProtocol {
    
    public var id: String { UUID().uuidString }
    
    public let width: Int
    
    public let height: Int
    
    public let url: String
        
    public init(
        width: Int,
        height: Int,
        url: String
    ) {
        self.width = width
        self.height = height
        self.url = url
    }
    
    @inlinable
    public init() {
        // Because user may use `width` and `height` to calculate aspect ratio of
        // this artwork, so use value `1` instead of `Int.init()`.
        width = 1
        height = 1
        url = .init()
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension ImageFile: Identifiable {}
