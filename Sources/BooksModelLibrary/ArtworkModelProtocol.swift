import Foundation

public protocol ArtworkModelProtocol: Model {
    var width: Int { get }
    var height: Int { get }
    var backgroundColor: String? { get }
    var foregroundColor: String? { get }
    var urlString: String { get }
}

public struct Artwork: ArtworkModelProtocol {
    
    public let id: String
    
    public let width: Int
    
    public let height: Int
    
    public let backgroundColor: String?
    
    public let foregroundColor: String?
    
    public let urlString: String
    
    public init(
        id: String = UUID().uuidString,
        width: Int,
        height: Int,
        backgroundColor: String? = nil,
        foregroundColor: String? = nil,
        urlString: String
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.urlString = urlString
    }
    
    @inlinable
    public init() {
        id = UUID().uuidString
        // Because user may use `width` and `height` to calculate aspect ratio of
        // this artwork, so use value `1` instead of `Int.init()`.
        width = 1
        height = 1
        backgroundColor = nil
        foregroundColor = nil
        urlString = .init()
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Artwork: Identifiable {}
