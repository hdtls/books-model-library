import Foundation

public struct Asset<File>: Codable where File: Codable {
    
    public var id: UInt64
    
    public var files: [File]
    
    public init() {
        id = .init()
        files = .init()
    }
}
