import Foundation
import RxSwift
import FirebaseDatabase
import FirebaseStorage

final class WallViewController: BaseViewController<WallView> {
    private let reuseIdentifier = "cell"
    private let viewModel = WallViewModel()
    private var apiManager = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.tableView.register(WallTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        getJigsaws()
        setupNavigationBar()
    }
    
    override func setupReactiveBinding() {
        viewModel.jigsaws.asObservable()
            .bind(to: customView.tableView.rx.items(cellIdentifier: reuseIdentifier)) { index, model, cell in
                guard let cell = cell as? WallTableViewCell else { return }
                cell.descriptionTextView.text = model.description
                //TODO: Add Template image
                //cell.mainImageView.image = UIImage(data: model.images?[0] ?? Data())
                cell.piecesCountLabel.text = (model.piecesCount ?? 0).description
                //TODO: Check if it's favorite
            }
            .disposed(by: disposeBag)
    }
    //TODO: Refresh after a while wjen there was no internet
    private func getJigsaws() {
        let response: Observable<[String: Jigsaw]> = apiManager.send(apiRequest: JigsawsForWallRequest(viewModel.jigsawsCount))
            
        response
            .observeOn(MainScheduler.instance)
            //.debounce(5, scheduler: MainScheduler.instance)
            .map({ (dict) -> [Jigsaw] in
                return Array(dict.values)
            })
            .subscribe(onNext: { [weak self] jigsaws in
                self?.viewModel.jigsaws.accept(jigsaws)
            }, onError: { [weak self] error in
                let alert = UIAlertController(withOkAction: nil, title: "General.Error".localized, message: error.localizedDescription)
                self?.present(alert, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
    
    private func addJigsawToFavorites(cell: WallTableViewCell) {
        
    }
    
    private func tradeJigsaw(cell: WallTableViewCell) {
        
    }
    
    private func setupNavigationBar() {
        let filterNavButton = UIBarButtonItem(title: "Wall.Filter".localized, style: .plain, target: self, action: #selector(filterButtonAction))
        let addNavButton = UIBarButtonItem(title: "Wall.Add".localized, style: .plain, target: self, action: #selector(addButtonAction))
        navigationItem.leftBarButtonItem = filterNavButton
        navigationItem.rightBarButtonItem = addNavButton
    }
    
    @objc private func filterButtonAction() {
        
    }
    
    @objc private func addButtonAction() {
        present(AddJigsawViewController(), animated: true, completion: nil)
    }
    
    //TODO: Add refresh
}
