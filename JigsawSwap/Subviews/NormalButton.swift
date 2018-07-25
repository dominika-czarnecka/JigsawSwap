import UIKit

class NormalButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            tintColor = isHighlighted ? .lightPink : .mainGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .mainGray
        backgroundColor = .mainPink
        layer.cornerRadius = 25
        
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: 50),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8)
        ])
    }
    
    @available(*, unavailable, message: "Please use init(style: UITableViewCellStyle, reuseIdentifier: String?) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
