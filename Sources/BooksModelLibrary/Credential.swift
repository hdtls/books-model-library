import Foundation

public struct Credential: Codable {
    
    public var id: UInt64?
        
    public var grantType: GrantType
    
    public var identity: String
    
    public var identityTokenString: String
    
    public init() {
        id = .init()
        grantType = .basic
        identity = .init()
        identityTokenString = .init()
    }
}

extension Credential {

    public enum GrantType: String, CaseIterable, Codable {
        case basic
        case apple
        case google
    }
}
