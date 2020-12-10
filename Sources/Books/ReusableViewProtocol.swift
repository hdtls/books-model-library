import Foundation

public protocol ReusableViewProtocol: class {
    static var reusableIdentifier: String { get }
}

extension ReusableViewProtocol {
    public static var reusableIdentifier: String {
        return String(describing: self)
    }
}
