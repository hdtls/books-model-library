import Foundation

public protocol SeriesModelProtocol: Model {
    var name: String { get }
}

public struct Series: SeriesModelProtocol {
    
    public let id: String
    
    public let name: String
    
    public init(
        id: String = UUID().uuidString,
        name: String
    ) {
        self.id = id
        self.name = name
    }
    
    @inlinable
    public init() {
        id = UUID().uuidString
        name = .init()
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Series: Identifiable {}
