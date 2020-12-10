#if os(iOS)
import UIKit
public typealias ImageView = UIImageView
public typealias TextLabel = UILabel

public protocol BookListedCellProtocol {
    associatedtype T: BookListedCellViewModelProtocol

    var bookCover: ImageView { get set }
    var titleLabel: TextLabel { get set }
    var subtitleLabel: TextLabel { get set }
    var bodyLabel: TextLabel { get set }
    var footnoteLabel: TextLabel { get set }
    var vm: T? { get set }
    var disposeBag: DisposeBag { get set }
    
    func setUp()
}

extension BookListedCellProtocol {
    public func setUp() {
        guard let vm = self.vm else { return }
        
        vm.title
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        vm.subtitle
            .drive(subtitleLabel.rx.text)
            .disposed(by: disposeBag)
        
        vm.body
            .drive(bodyLabel.rx.text)
            .disposed(by: disposeBag)
        
        vm.footnote
            .drive(footnoteLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

fileprivate class __BookListedCellContentView<T: BookListedCellViewModelProtocol>: UIView, BookListedCellProtocol {
    var bookCover: ImageView = .init(frame: .zero)
    
    var titleLabel: TextLabel = .init(frame: .zero)
    
    var subtitleLabel: TextLabel = .init(frame: .zero)
    
    var bodyLabel: TextLabel = .init(frame: .zero)
    
    var footnoteLabel: TextLabel = .init(frame: .zero)
    
    var vm: T? {
        didSet {
            setUp()
        }
    }
    
    var disposeBag: DisposeBag = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

open class BookListedCell<T: BookListedCellViewModelProtocol>: UITableViewCell, ReusableViewProtocol {
    
    private var _contentView: __BookListedCellContentView<T> = .init()
    
    public var vm: T? {
        set {
            _contentView.vm = newValue
        }
        get {
            _contentView.vm
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.contentView.addSubview(_contentView)
        _contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        _contentView = __BookListedCellContentView<T>()
        self.contentView.addSubview(_contentView)
        _contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        
        _contentView.disposeBag = DisposeBag()
    }
}

open class BookListedCollectionCell<T: BookListedCellViewModelProtocol>: UICollectionViewCell, ReusableViewProtocol {

    private var _contentView: __BookListedCellContentView<T> = .init()

    public var vm: T? {
        set {
            _contentView.vm = newValue
        }
        get {
            _contentView.vm
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(_contentView)
        _contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.contentView.addSubview(_contentView)
        _contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        
        _contentView.disposeBag = DisposeBag()
    }
}
#endif
