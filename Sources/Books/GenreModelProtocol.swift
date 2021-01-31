import Foundation

public protocol GenreModelProtocol: Model {
    var name: String { get }
}

public struct Genre: GenreModelProtocol {
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

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Genre: Identifiable {}
