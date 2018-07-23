import RxSwift
import RxCocoa

class ApiManager {
    private let baseURL = URL(string: "https://jigsawswap-395bd.firebaseio.com/")!
    
    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { [unowned self] observer in
            let request = apiRequest.request(with: self.baseURL)
            print(request)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    observer.onError(error)
                    return
                }
                
                /////
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        print("JSON:\n" + String(describing: json) + "\n")
                    } catch {
                        observer.onError(error)
                        print(error)
                    }
                }
                //////
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}