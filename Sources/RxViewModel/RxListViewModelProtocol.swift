import Foundation

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol RxListViewModelProtocol
: RxViewModelProtocol where Base: RandomAccessCollection, Base.Element: RxViewModelProtocol {}

open class RxListViewModel<Base>
: RxViewModel<Base> where Base: RandomAccessCollection & Hashable, Base.Element: RxViewModelProtocol {}
