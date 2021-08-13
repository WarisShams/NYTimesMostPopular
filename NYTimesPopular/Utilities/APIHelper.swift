//
//  APIHelper.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import UIKit

public let ServicesManager = APIHelper.shared

open class APIHelper: NSObject {
    
    private var baseURI: String = ""
    
    public static let shared = APIHelper()
    
    let responseType: String = ".json"
    
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    
    private var dataTask: URLSessionDataTask?
    
    open var ROOT_API: String {
        get {
            return baseURI
        }
        set (new_path) {
            baseURI = new_path
            
        }
    }
    
    override init (){
        super.init()
    }
    
    
    private static let allowedHttpMethods: Set =
        [HTTPMethod.GET, HTTPMethod.POST, HTTPMethod.PUT, HTTPMethod.DELETE]
    
    fileprivate func getURL(path: String) -> String {
        var finalPath = ""
        if path.contains("?") {
            finalPath = ROOT_API + path + "api-key=\(Host.apiKey)"
        } else {
            finalPath = ROOT_API + path + "?api-key=\(Host.apiKey)"
        }
        return finalPath
    }
    
    fileprivate func getHeader() -> [String: String] {
        
        let url: [String: String] = [:]
        
        return url
    }
    
    // todo: add more methods
    public class HTTPMethod{
        static let GET = "GET"
        static let POST = "POST"
        static let PUT = "PUT"
        static let DELETE = "DELETE"
    }
    
    open func getJSON( _ response: Data,
                       failure: @escaping (NSError) -> Void) -> Any? {
        
        do {
            let json = try JSONSerialization.jsonObject(with: response, options: [])
            
            debugPrint(json)
            return json
        } catch let error as NSError {
            debugPrint(error.debugDescription)
            DispatchQueue.main.async(execute: {
                failure(error)
            })
            return nil
        }
        
    }
    
    /// provides all the facilities to call an HTTP API
    ///
    /// - Parameters:
    ///   - url: a url object of the api endpoint
    ///   - method: String of http method e.g. "GET"
    ///   - headers: `[String: String]`
    ///   - data: byte array passed into the body of the request
    ///   - callback: callback to run async after the request is recieved
    fileprivate func call(_ url: URL,
                          method: String,
                          headers: [String : String],
                          data: Data?,
                          failure: @escaping ((NSError) -> Void),
                          success: @escaping (Data, HTTPURLResponse) -> ()) {
        
        var request = URLRequest(url: url)
        assert(APIHelper.allowedHttpMethods.contains(method))
        request.httpMethod = method
        // add headers
        for (header, value) in headers {
            request.addValue(value, forHTTPHeaderField: header)
        }
        
        if method == HTTPMethod.POST {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        request.httpBody = data
        
        dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            
            defer {
                self?.dataTask = nil
            }
            
            guard let data = data, error == nil else { // check for fundamental networking error
                failure(NSError(domain: error!.localizedDescription, code: -1, userInfo: nil))
                return
            }
            
            
            if let httpResponse = response as? HTTPURLResponse {
                debugPrint("doing callback for the method")
                
                if let json = self?.getJSON(data, failure: failure) {
                    DispatchQueue.main.async(execute: {
                        
                        if let myJson = json as? [String:Any] {
                            
                            if let responseDict = myJson["fault"] as? [String:Any] {
                                var error: NSError!
                                if let faultString = responseDict["faultstring"] as? String {
                                    
                                    let userInfo: [AnyHashable: Any] = [ NSLocalizedDescriptionKey :  NSLocalizedString("Error", value: faultString, comment: "")]
                                    
                                    error = NSError(domain: "",
                                                    code: -1,
                                                    userInfo: userInfo as? [String : Any])
                                } else {
                                    let userInfo: [AnyHashable: Any] = [ NSLocalizedDescriptionKey :  NSLocalizedString("Error", value: "Sorry, This time we are unable to fetch requested result. Please try again.", comment: "")]
                                    
                                    error = NSError(domain: "",
                                                    code: -1,
                                                    userInfo: userInfo as? [String : Any])
                                }
                                
                                failure(error)
                            } else {
                                
                                success(data, httpResponse)
                            }
                        }
                    })
                } else {
                    
                    success(data, httpResponse)
                }
            }
        }
        dataTask?.resume()
    }
    
    private func encode (_ params: [String: Any]) -> [String: String] {
        let unencodedCharacterSet = CharacterSet(charactersIn: "-_.~").union(.alphanumerics)
        var encodedParams : [String: String] = [:]
        for (key, value) in params{
            let encodedKey = key.addingPercentEncoding(withAllowedCharacters: unencodedCharacterSet)!
            let encodedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: unencodedCharacterSet)!
            encodedParams[encodedKey] = encodedValue
        }
        return encodedParams
    }
    
    private func paramString(_ params: [String: Any]) -> String {
        var postString = ""
        var first = true
        for (key, value) in params{
            if first {
                postString = key + "=" + "\(value)"
                first = false
            }else{
                postString = postString + "&" + key + "=" + "\(value)"
            }
        }
        return postString
    }
    private func postString(_ params: [String: Any]) -> String {
        return paramString(encode(params))
    }
    private func queryString(_ params: [String: Any]) -> String {
        var queryString = params.count > 0 ? "?" : ""
        queryString += paramString(encode(params))
        return queryString
    }
    
    func getCurrentTimeZone() ->String {
        
        let timeZoneOffset = ((NSTimeZone.system.secondsFromGMT()) / 3600) * -60
        return "\(timeZoneOffset)"
        
    }
    
    /// GET Request to API
    ///
    /// - Parameters:
    ///   - endpoint: String of enpoint * note: it cannot start with "/"
    ///   - headers: Map of strings for header name and values
    ///   - params: post body parameters as Map of Strings
    ///   - success: success callback
    ///   - failure: failure callback
    internal func get(_ endpoint: String, headers: [String: String] = [:],
             params: [String: Any] = [:],
             failure: @escaping ((Error) -> Void),
             success: @escaping (Data, HTTPURLResponse) -> ()) {
        
        var qs = queryString(params)
        qs = getURL(path: endpoint + qs)
        debugPrint("Request: " + qs)
        
        if let url = URL(string: qs) {
            call(url,
                 method: HTTPMethod.GET,
                 headers: self.getHeader(),
                 data: nil,
                 failure: failure,
                 success: success)
        } else {
            failure(NSError(domain: "Unsupported url.", code: 0, userInfo: nil))
        }
    }
}
