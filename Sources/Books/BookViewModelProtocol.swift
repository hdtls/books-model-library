import Foundation
import RxVMLibrary
#if canImport(RxCocoa)
import RxCocoa
#endif

public protocol BookViewModelProtocol: RxViewModelProtocol where Base: BookModelProtocol {
    var coverArtUrl: URL { get }
    var artistName: String { get }
    #if canImport(RxCocoa)
    var coverArtURLDriver: Driver<URL> { get }
    var artistNameDriver: Driver<URL> { get }
    #endif
}

public protocol BookListViewModelProtocol: RxListViewModelProtocol where Base.Element: BookViewModelProtocol {}
