import Foundation

public protocol ArtworkModelProtocol: Model {
    var width: Int { get }
    var height: Int { get }
    var backgroundColor: String? { get }
    var foregroundColor: String? { get }
    var urlString: String { get }
}

public struct Artwork: ArtworkModelProtocol {
    public var id: String { UUID().uuidString }
    
    public let width: Int
    
    public let height: Int
    
    public let backgroundColor: String?
    
    public let foregroundColor: String?
    
    public let urlString: String
    
    public init(
        width: Int,
        height: Int,
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
