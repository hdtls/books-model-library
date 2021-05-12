import Foundation

public protocol AuthorModelProtocol: Model {
    var username: String { get set }
}

public struct User: AuthorModelProtocol {
    
    public var id: UInt64
    
    public var username: String
            
    public init(
        username: String
    ) {
        self.id = .init()
        self.username = username
    }
    
    @inlinable
    public init() {
        id = .init()
        username = .init()
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension User: Identifiable {}

extension User {

    public enum Role: String, CaseIterable, Codable {
        case reader
        case robot
        case author
        case publisher
    }
}
