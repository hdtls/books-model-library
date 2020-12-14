import Foundation

public protocol RxEmbeddedViewModelProtocol
: RxViewModelProtocol where Embedded: RxViewModelProtocol {
    associatedtype Embedded
    var embedded: Embedded { get set }
}

open class RxEmbeddedViewModel<Base: Hashable, Embedded>
: RxViewModel<Base>, RxEmbeddedViewModelProtocol where Embedded: RxViewModelProtocol {
    
    public var embedded: Embedded
    
    public init(title: String = "", base: Base, embedded: Embedded) {
        self.embedded = embedded
        super.init(title: title, base: base)
    }
}
