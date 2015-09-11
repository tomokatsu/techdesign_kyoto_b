import AlamofireObjectMapper
import ObjectMapper
import Alamofire

class APIClient {
    static let sharedInstance = APIClient()

    private static let rootURL = ""

    private init() {}

    private func getPathFromEndpoint(endpoint: String) -> String {
        return APIClient.rootURL + endpoint
    }

    func GET<T: Mappable>(endpoint: String, parameter: [String: AnyObject], completion: ((T?, NSError?) -> Void)) {
        Alamofire.request(.GET, getPathFromEndpoint(endpoint), parameters: parameter, encoding: .URL)
            .responseObject { (response: T?, err: NSError?) in
                if let error = err { /* エラー処理 */}
                completion(response, err)
        }
    }
    
}

