import Foundation

public protocol AuthorModelProtocol: Model {
    var username: String { get set }
    var name: String? { get set }
    var role: User.Role { get set }
}

public struct User: AuthorModelProtocol {
    
    public var id: UInt64
    
    public var username: String
    
    public var name: String?
    
    public var role: Role
    
    public init(username: String, name: String? = nil) {
        self.id = .init()
        self.username = username
        self.name = name ?? username
        self.role = .reader
    }
    
    @inlinable
    public init() {
        id = .init()
        username = .init()
        name = .init()
        role = .reader
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
        case admin
    }
}

extension User.Role: Comparable {
    
    public static func < (lhs: User.Role, rhs: User.Role) -> Bool {
        switch lhs {
            case .reader:
                return rhs != reader
            case .robot:
                return rhs != .reader && rhs != .robot
            case .author:
                return rhs == .publisher || rhs == .admin
            case .publisher:
                return rhs == .admin
            case .admin:
                return false
        }
    }
}
