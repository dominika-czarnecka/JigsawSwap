import UIKit

class WallTableViewCell: BaseTableViewCell {
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let shadowView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.4)
        return view
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.isUserInteractionEnabled = false
        textView.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        textView.backgroundColor = .clear
        textView.textColor = .white
        return textView
    }()
    //TODO: Make hit area at least 44 p if this stays
    let tradeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "trade"), for: .normal)
        button.imageView?.tintColor = .mainGray
        return button
    }()
    
    let favoriteButton: UIButton = {
        let buttton = UIButton()
        buttton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        buttton.tintColor = .mainGray
        return buttton
    }()
    
    let piecesCountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "puzzle").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    let piecesCountLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
 
    override func configureConstraints() {
        [mainImageView, shadowView, descriptionTextView, favoriteButton, tradeButton, piecesCountImageView, piecesCountLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        addConstraints([
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.heightAnchor.constraint(equalTo: heightAnchor),
            mainImageView.widthAnchor.constraint(equalTo: widthAnchor),
            mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addConstraints([
            shadowView.topAnchor.constraint(equalTo: mainImageView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor),
            shadowView.leftAnchor.constraint(equalTo: mainImageView.leftAnchor),
            shadowView.rightAnchor.constraint(equalTo: mainImageView.rightAnchor)
        ])
        addConstraints([
            tradeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat.LayoutDimensions.margin),
            tradeButton.heightAnchor.constraint(equalToConstant: CGFloat.LayoutDimensions.standardButtonHeight),
            tradeButton.widthAnchor.constraint(equalTo: tradeButton.heightAnchor),
            tradeButton.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.LayoutDimensions.margin)
        ])
        addConstraints([
            favoriteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -CGFloat.LayoutDimensions.margin),
            favoriteButton.heightAnchor.constraint(equalToConstant: CGFloat.LayoutDimensions.standardButtonHeight),
            favoriteButton.widthAnchor.constraint(equalTo: tradeButton.heightAnchor),
            favoriteButton.topAnchor.constraint(equalTo: tradeButton.topAnchor)
        ])
        addConstraints([
            piecesCountImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat.LayoutDimensions.margin),
            piecesCountImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat.LayoutDimensions.margin),
            piecesCountImageView.heightAnchor.constraint(equalToConstant: CGFloat.LayoutDimensions.standardButtonHeight * 0.7),
            piecesCountImageView.widthAnchor.constraint(equalTo: piecesCountImageView.heightAnchor)
        ])
        addConstraints([
            piecesCountLabel.topAnchor.constraint(equalTo: piecesCountImageView.topAnchor),
            piecesCountLabel.bottomAnchor.constraint(equalTo: piecesCountImageView.bottomAnchor),
            piecesCountLabel.leftAnchor.constraint(equalTo: piecesCountImageView.rightAnchor, constant: 5)
        ])
        addConstraints([
            descriptionTextView.topAnchor.constraint(equalTo: tradeButton.bottomAnchor, constant: CGFloat.LayoutDimensions.margin),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat.LayoutDimensions.margin),
            descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTextView.widthAnchor.constraint(equalTo: widthAnchor, constant: -CGFloat.LayoutDimensions.margin * 2 )
        ])
    }
}
