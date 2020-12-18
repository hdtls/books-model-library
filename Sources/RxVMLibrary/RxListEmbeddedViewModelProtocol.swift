import Foundation

public protocol RxListEmbeddedViewModelProtocol
: RxViewModelProtocol where Embedded: RxListViewModelProtocol {
    associatedtype Embedded
    var embedded: Embedded { get set }
}

open class RxListEmbeddedViewModel<Base: Hashable, Embedded>
: RxViewModel<Base>, RxListEmbeddedViewModelProtocol where Embedded: RxListViewModelProtocol {
    
    public var embedded: Embedded
    
    public init(title: String = "", base: Base, embedded: Embedded) {
        self.embedded = embedded
        super.init(title: title, base: base)
    }
}
