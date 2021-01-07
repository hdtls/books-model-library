import Foundation

public protocol ArtistModelProtocol: Model {
    var name: String { get }
}

public struct Artist: ArtistModelProtocol {
    public let id: String
    
    public let name: String
    
    public init(
        id: String = UUID().uuidString,
        name: String
    ) {
        self.id = id
        self.name = name
    }
}
