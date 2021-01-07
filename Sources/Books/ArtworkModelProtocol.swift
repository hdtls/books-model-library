import Foundation

public protocol ArtworkModelProtocol: Model {
    var width: CGFloat { get }
    var height: CGFloat { get }
    var backgroundColor: String? { get }
    var foregroundColor: String? { get }
    var urlString: String { get }
}

public struct Artwork: ArtworkModelProtocol {
    public var id: String { UUID().uuidString }
    
    public let width: CGFloat
    
    public let height: CGFloat
    
    public let backgroundColor: String?
    
    public let foregroundColor: String?
    
    public let urlString: String
    
    public init(
        width: CGFloat,
        height: CGFloat,
        backgroundColor: String? = nil,
        foregroundColor: String? = nil,
        urlString: String
    ) {
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.urlString = urlString
    }
}
