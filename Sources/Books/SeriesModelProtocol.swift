import Foundation

public protocol SeriesModelProtocol: Model {
    var name: String { get }
}

public struct Series: SeriesModelProtocol {
    public let id: UUID
    
    public let name: String
    
    public init(
        id: UUID = .init(),
        name: String
    ) {
        self.id = id
        self.name = name
    }
}
