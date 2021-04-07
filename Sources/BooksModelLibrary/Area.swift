import Foundation

public protocol AreaModelProtocol: Model {
    var name: String { get set }
}

public struct Area: AreaModelProtocol {
    
    public var id: String
    
    public var name: String
    
    @inlinable
    public init() {
        self.id = UUID().uuidString
        self.name = .init()
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Area: Identifiable {}
