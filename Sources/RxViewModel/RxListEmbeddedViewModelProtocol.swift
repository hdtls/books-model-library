import Foundation

public protocol RxListEmbeddedViewModelProtocol
: RxViewModelProtocol where Embedded: RandomAccessCollection, Embedded.Element: RxViewModelProtocol {
    associatedtype Embedded
    var embedded: Embedded { get set }
}

open class RxListEmbeddedViewModel<Base: Hashable, Embedded>
: RxViewModel<Base>, RxListEmbeddedViewModelProtocol where Embedded: RandomAccessCollection, Embedded.Element: RxViewModelProtocol {
    
    public var embedded: Embedded
    
    public init(title: String = "", base: Base, embedded: Embedded) {
        self.embedded = embedded
        super.init(title: title, base: base)
    }
}
