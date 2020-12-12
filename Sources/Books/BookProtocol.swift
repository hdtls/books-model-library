import Foundation

public protocol Model: Identifiable, Equatable, Hashable {}

public protocol BookProtocol: Model {
    var imageUrl: String? { get set }
    var title: String? { get set }
    var subtitle: String? { get set }
    var body: String? { get set }
    var footnote: String? { get set }
}
