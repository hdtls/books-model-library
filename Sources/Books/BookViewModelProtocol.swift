import Foundation
import RxViewModel
#if canImport(RxCocoa)
import RxCocoa
#endif

public protocol BookViewModelProtocol: RxViewModelProtocol where Base: BookProtocol {
    var imageUrl: URL? { get }
    var formattedAuthorsString: String { get }
    #if canImport(RxCocoa)
    var imageUrlDriver: Driver<URL?> { get }
    var formattedAuthorsStringDriver: Driver<URL?> { get }
    #endif
}

public protocol BookListViewModelProtocol: RxListViewModelProtocol where Base.Element: BookViewModelProtocol {}
