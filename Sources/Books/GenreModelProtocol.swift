import Foundation

public protocol GenreModelProtocol: Model {
    var name: String { get }
}

public struct Genre: GenreModelProtocol {
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
