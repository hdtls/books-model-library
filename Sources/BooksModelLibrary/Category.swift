import Foundation

public protocol CategoryModelProtocol: Model {
    var name: String { get set }
}

public struct Category: CategoryModelProtocol {
    
    public var id: UInt64
    
    public var name: String
    
    @inlinable
    public init() {
        id = .init()
        name = .init()
    }
    
    public init(name: String) {
        self.id = .init()
        self.name = name
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Category: Identifiable {}
