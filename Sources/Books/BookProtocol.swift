import Foundation

public protocol Model: Identifiable, Hashable {}

public protocol BookProtocol: Model {
    var title: String? { get set }
    var subtitle: String? { get set }
    var body: String? { get set }
    var footnote: String? { get set }
    var imageUrl: String? { get set }
    var authors: [String]? { get set }
}
