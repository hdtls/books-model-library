import Foundation

public protocol ImageModelProtocol: Model {
    var width: Int? { get }
    var height: Int? { get }
    var backgroundColor: String? { get }
    var foregroundColor: String? { get }
    var url: String? { get }
    var refUrls: [String]? { get }
}

public struct ImageFile: ImageModelProtocol {
    
    public var id: String { UUID().uuidString }
    
    public let width: Int?
    
    public let height: Int?
    
    public let backgroundColor: String?
    
    public let foregroundColor: String?
    
    public let url: String?
    
    public let refUrls: [String]?
    
    public init(
        width: Int?,
        height: Int?,
        backgroundColor: String? = nil,
        foregroundColor: String? = nil,
        url: String,
        refUrls: [String]? = nil
    ) {
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.url = url
        self.refUrls = refUrls
    }
    
    @inlinable
    public init() {
        // Because user may use `width` and `height` to calculate aspect ratio of
        // this artwork, so use value `1` instead of `Int.init()`.
        width = nil
        height = nil
        backgroundColor = nil
        foregroundColor = nil
        url = .init()
        refUrls = nil
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension ImageFile: Identifiable {}
