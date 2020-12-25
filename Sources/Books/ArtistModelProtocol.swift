import Foundation

public protocol ArtistModelProtocol: Model {
    var name: String { get }
}

public struct Artist: ArtistModelProtocol {
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
