import UIKit

class SmallButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            tintColor = isHighlighted ? .lightPink : .mainGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .mainGray
        
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: 30),
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    @available(*, unavailable, message: "Please use init(style: UITableViewCellStyle, reuseIdentifier: String?) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
