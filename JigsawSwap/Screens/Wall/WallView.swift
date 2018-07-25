import UIKit

final class WallView: BaseView {
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.rowHeight = 150
        return tableView
    }()
    
    override init() {
        super.init()
    }
    
    override func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addConstraints([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: UIApplication.shared.keyWindow?.rootViewController?.additionalSafeAreaInsets.top ?? 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: UIApplication.shared.keyWindow?.rootViewController?.additionalSafeAreaInsets.bottom ?? 0),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: UIApplication.shared.keyWindow?.rootViewController?.additionalSafeAreaInsets.left ?? 0),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: UIApplication.shared.keyWindow?.rootViewController?.additionalSafeAreaInsets.right ?? 0)
        ])
    }
}
