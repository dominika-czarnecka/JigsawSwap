import Foundation
import UIKit
import RxSwift
import RxCocoa
import Photos

final class AddJigsawViewController: BaseViewController<AddJigsawView>, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let viewModel = AddJigsawViewModel()
    private let pickerController = UIImagePickerController()
    lazy var apiManager = ApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
    }
    
    override func setupReactiveBinding() {
        //TextFields
        customView.piecesCountTextFiled.rx.text
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] (text) in
                guard let strongSelf = self else { return }
                if strongSelf.customView.piecesCountTextFiled.isValid() {
                    strongSelf.viewModel.piecesCount = Int(text ?? "0") ?? 0
                } else {
                    strongSelf.viewModel.piecesCount = nil
                }
            })
            .disposed(by: disposeBag)
        
        customView.missingPiecenCountTextField.rx.text
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] (text) in
                guard let strongSelf = self else { return }
                if strongSelf.customView.missingPiecenCountTextField.isValid() {
                    strongSelf.viewModel.missingPiecesCount = Int(text ?? "0") ?? 0
                } else {
                    strongSelf.viewModel.missingPiecesCount = nil
                }
            })
            .disposed(by: disposeBag)
        
        customView.descriptionTextField.rx.text
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] (text) in
                guard let strongSelf = self else { return }
                strongSelf.viewModel.description = text
                _ = strongSelf.customView.descriptionTextField.isValid()
            })
            .disposed(by: disposeBag)
        
        //Buttons
        customView.cancelButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        customView.addButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let strongSelf = self, let jigsaw = strongSelf.viewModel.jigsaw, strongSelf.customView.piecesCountTextFiled.isValid(), strongSelf.customView.missingPiecenCountTextField.isValid() else { return }
                let addJigsawRequest = AddJigsawRequest(jigsaw)
                let jigsawID: Observable<[String: String]> = strongSelf.apiManager.send(apiRequest: addJigsawRequest)
                
                jigsawID.asObservable()
                    .subscribe(onNext: { [weak self] (idDictionary) in
                        DispatchQueue.main.async {
                            guard let strongSelf = self, let image = strongSelf.customView.imageView.image, let name = idDictionary["name"] else { return }
                            strongSelf.sendImage(image, for: name)
                        }
                        
                        }, onError: { [weak self] (error) in
                            print(error)
                            let alert = UIAlertController(withOkAction: nil, title: "Error".localized, message: "Error.UnableToAddJigsaw".localized)
                            self?.present(alert, animated: true, completion: nil)
                    })
                    .disposed(by: strongSelf.disposeBag)
            })
        .disposed(by: disposeBag)
        
        customView.addImageButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let strongSelf = self else { return }
                if strongSelf.customView.imageView.image != nil {
                    strongSelf.customView.imageView.image = nil
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.7, animations: {
                            strongSelf.customView.addImageButton.transform = CGAffineTransform.identity
                        })
                    }
                } else {
                    let alert = strongSelf.prepareActionSheet()
                    strongSelf.present(alert, animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func prepareActionSheet() -> UIAlertController {
        let alert = UIAlertController(title: "AddJigsaw.AddImage".localized, message: "AddJigsaw.ChooseMetod".localized, preferredStyle: .actionSheet)
        
        let alertActionCamera = UIAlertAction(title: "AddJigsaw.Camera".localized, style: .default, handler: { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.pickerController.sourceType = .camera
            strongSelf.present(strongSelf.pickerController, animated: true, completion: nil)
        })
        let alertActionGallery = UIAlertAction(title: "AddJigsaw.Gallery".localized, style: .default, handler: { [weak self] (_) in
            guard let strongSelf = self else { return }
            PHPhotoLibrary.requestAuthorization({ (status) in
                guard status == PHAuthorizationStatus.authorized else { return }
                strongSelf.pickerController.sourceType = .photoLibrary
                strongSelf.present(strongSelf.pickerController, animated: true, completion: nil)
            })
        })
        let alertActionCancel = UIAlertAction(title: "Alert.Cancel".localized, style: .destructive, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
        })
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(alertActionCamera)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alert.addAction(alertActionGallery)
        }
        alert.addAction(alertActionCancel)
        
        return alert
    }
    
    func sendImage(_ image: UIImage, for jigsawID: String) {
        let imageId: Observable<[String: String]> = apiManager.send(apiRequest: PostJigsawImage(image: image, name: jigsawID), isImage: true)
        
        imageId
            .subscribe(onNext: { [weak self] (imageID) in
                print(imageId)
            }, onError: { [weak self] (error) in
                print(error)
                let alert = UIAlertController(withOkAction: nil, title: "Error".localized, message: "Error.UnableToAddJigsaw".localized)
                self?.present(alert, animated: true, completion: nil)
            })
        .disposed(by: disposeBag)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            customView.imageView.image = image

            DispatchQueue.main.async {
                let originalTransform = self.customView.addImageButton.transform
                let scaledTransform = originalTransform.scaledBy(x: 0.6, y: 0.6)
                let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: self.customView.imageView.frame.width * 0.65, y: -self.customView.imageView.frame.height * 0.65)
                let scaledTransformedAndRotatedTransform = scaledAndTranslatedTransform.rotated(by: .pi * 0.25)
                UIView.animate(withDuration: 0.7, animations: {
                    self.customView.addImageButton.transform = scaledTransformedAndRotatedTransform
                })
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    }
}
