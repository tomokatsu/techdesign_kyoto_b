import AlamofireObjectMapper
import ObjectMapper
import Alamofire

class APIClient {
    static let sharedInstance = APIClient()

    private static let rootURL = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsSearch"

    private init() {}

    func GET<T: Mappable>(parameter: [String: AnyObject]?, completion: ((T?, NSError?) -> Void)) {
        Alamofire.request(.GET, APIClient.rootURL, parameters: parameter, encoding: .URL)
            .responseObject { (response: T?, err: NSError?) in
                if let error = err { /* エラー処理 */}
                completion(response, err)
        }
    }
    
}

