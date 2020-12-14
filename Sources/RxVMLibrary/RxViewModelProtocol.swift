import Foundation

#if canImport(RxSwift) && canImport(RxRelay)
import RxSwift
import RxRelay
public protocol RxViewModelLifeCycle {

    var isActive: BehaviorRelay<Bool> { get }
        
    // MARK: Life cycle
    /**
     Rx `Observable` for the `active` flag. (when it becomes `true`).
     
     Will send messages only to *new* & *different* values.
     */
    var didBecomeActive: Observable<Self> { get }
    
    /**
     Rx `Observable` for the `active` flag. (when it becomes `false`).
     
     Will send messages only to *new* & *different* values.
     */
    var didBecomeInactive: Observable<Self> { get }
    
    /**
     Subscribes (or resubscribes) to the given signal whenever
     `didBecomeActiveSignal` fires.
     
     When `didBecomeInactiveSignal` fires, any active subscription to `signal` is
     disposed.
     
     Returns a signal which forwards `next`s from the latest subscription to
     `signal`, and completes when the receiver is deallocated. If `signal` sends
     an error at any point, the returned signal will error out as well.
     */
    func forwardSignalWhileActive<T>(_ observable: Observable<T>) -> Observable<T>
    
    /**
     Throttles events on the given `observable` while the receiver is inactive.
     
     Unlike `forwardSignalWhileActive:`, this method will stay subscribed to
     `observable` the entire time, except that its events will be throttled when the
     receiver becomes inactive.
     
     - parameter observable: The `Observable` to which this method will stay
     subscribed the entire time.
     
     - returns: Returns an `observable` which forwards events from `observable` (throttled while the
     receiver is inactive), and completes when `observable` completes or the receiver
     is deallocated.
     */
    func throttleSignalWhileInactive<T>(_ observable: Observable<T>) -> Observable<T>
}

extension RxViewModelLifeCycle {
    public var didBecomeActive: Observable<Self> {
        isActive
            .filter { $0 == true }
            .map { _ in return self }
    }
    
    public var didBecomeInactive: Observable<Self> {
        isActive
            .filter { $0 == false }
            .map { _ in return self }
    }
    
    public func forwardSignalWhileActive<T>(_ observable: Observable<T>) -> Observable<T> {
        let signal = self.isActive
        
        return Observable.create { (obs: AnyObserver<T>) -> Disposable in
            let disposable = CompositeDisposable()
            var signalDisposable: Disposable? = nil
            var disposeKey: CompositeDisposable.DisposeKey?
            
            let activeDisposable = signal.subscribe( onNext: { active in
                if active == true {
                    signalDisposable = observable.subscribe( onNext: { value in
                        obs.on(.next(value))
                    }, onError: { error in
                        obs.on(.error(error))
                    }, onCompleted: {})
                    
                    if let sd = signalDisposable { disposeKey = disposable.insert(sd) }
                } else {
                    if let sd = signalDisposable {
                        sd.dispose()
                        if let dk = disposeKey {
                            disposable.remove(for: dk)
                        }
                    }
                }
            }, onError: { error in
                obs.on(.error(error))
            }, onCompleted: {
                obs.on(.completed)
            })
            
            _ = disposable.insert(activeDisposable)
            
            return disposable
        }
    }
    
    public func throttleSignalWhileInactive<T>(_ observable: Observable<T>) -> Observable<T> {
        let result = ReplaySubject<T>.create(bufferSize: 1)
        
        let activeSignal = self.isActive.asObservable()
            .takeUntil(Observable.create { (_: AnyObserver<T>) -> Disposable in
                observable.subscribe(onCompleted: {
                    defer { result.dispose() }
                    
                    result.on(.completed)
                })
            })
        
        _ = Observable.combineLatest(activeSignal, observable)
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .filter({ !$0.0 })
            .subscribe(onNext: {
                result.on(.next($0.1))
            }, onError: { (_) in
                result.on(.completed)
            })
        
        return result
    }
}
#else
public protocol RxViewModelLifeCycle {}
#endif


@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol RxViewModelProtocol: ObservableObject, Identifiable, Hashable, RxViewModelLifeCycle {
    associatedtype Base: Hashable
    
    var base: Base { get set }
    var __base: Published<Base> { get }
    var _$base: Published<Base>.Publisher { get }
    
    var title: String { get set }
    var __title: Published<String> { get }
    var _$title: Published<String>.Publisher { get }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension RxViewModelProtocol {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(base)
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension RxViewModelProtocol {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title && lhs.base == rhs.base
    }
}

open class RxViewModel<Base: Hashable>: RxViewModelProtocol {
    
    @Published public var base: Base
    public var __base: Published<Base> { _base }
    public var _$base: Published<Base>.Publisher { $base }
    
    @Published public var title: String
    public var __title: Published<String> { _title }
    public var _$title: Published<String>.Publisher { $title }
    
    public init(title: String = "", base: Base) {
        self.title = title
        self.base = base
    }
}
