import Foundation

public protocol AuthorModelProtocol: Model {
    var name: String { get set }
}

public struct Author: AuthorModelProtocol {
    
    public var id: UInt64
    
    public var name: String
        
    public init(
        name: String
    ) {
        self.id = .init()
        self.name = name
    }
    
    @inlinable
    public init() {
        id = .init()
        name = .init()
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Author: Identifiable {}
