import Foundation

public protocol RxLoadableViewModelProtocol: RxViewModelProtocol {
    associatedtype Parameters
    
    var pull: BehaviorRelay<Parameters> { get }
   
    func onLoading(_ page: Parameters) -> Observable<Result<Base?, Error>>
}

extension RxLoadableViewModelProtocol {
    public func setUp() {
        didBecomeActive
            .observeOn(ConcurrentDispatchQueueScheduler.init(qos: .utility))
            .subscribeOn(ConcurrentMainScheduler.instance)
            .withLatestFrom(pull)
            .flatMapLatest(onLoading)
            .catchErrorJustReturn(.success(nil))
            .bind(to: base)
            .disposed(by: disposeBag)
    }
}
