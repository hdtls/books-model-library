import Foundation
import protocol Alamofire.URLConvertible

public protocol BookListedCellViewModelProtocol: RxViewModelProtocol where Base: BookProtocol {
    var imageURL: Driver<URL?> { get set }
    var title: Driver<String?> { get set }
    var subtitle: Driver<String?> { get set }
    var body: Driver<String?> { get set }
    var footnote: Driver<String?> { get set }
}

extension BookListedCellViewModelProtocol {
    public func setup() {
        imageURL = base
            .map({ try? $0.get()?.imageUrl?.asURL() })
            .asDriver(onErrorJustReturn: nil)
        
        title = base
            .map({ try? $0.get()?.title })
            .asDriver(onErrorJustReturn: nil)
        
        subtitle = base
            .map({ try? $0.get()?.subtitle })
            .asDriver(onErrorJustReturn: nil)
        
        body = base
            .map({ try? $0.get()?.body })
            .asDriver(onErrorJustReturn: nil)
        
        footnote = base
            .map({ try? $0.get()?.footnote })
            .asDriver(onErrorJustReturn: nil)
    }
}
