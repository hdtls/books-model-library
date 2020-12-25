import Foundation

public protocol ArtworkModelProtocol: Model {
    var width: CGFloat { get }
    var height: CGFloat { get }
    var backgroundColor: String? { get }
    var foregroundColor: String? { get }
    var url: String { get }
}

public struct Artwork: ArtworkModelProtocol {
    public let id: UUID
    
    public let width: CGFloat
    
    public let height: CGFloat
    
    public let backgroundColor: String?
    
    public let foregroundColor: String?
    
    public let url: String
    
    public init(
        id: UUID = .init(),
        width: CGFloat,
        height: CGFloat,
        backgroundColor: String? = nil,
        foregroundColor: String? = nil,
        url: String
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.url = url
    }
}
