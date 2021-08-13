//
//  NYTPopulerServices.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import Foundation

extension APIHelper {
    fileprivate var serviceBase: String {
        get {
            return "viewed/"
        }
    }
    
    fileprivate func getPath(_ method: String) -> String {
        
        return serviceBase + method + responseType
    }
    
    //MARK:- Get Most Viewed -
    /**
     
     `GET` api to get most viewed stories.
     
     - Parameter period: `Int` period should be 1, 7 or 30
     - Parameter success: `NYTMostPopularFeeds` response in case of success.
     - parameter failure: `NSError` in case of Failure.
     
     */
    open func getMostViewedPosts(period: Int,
                       success: @escaping (NYTMostPopularFeeds)->Void,
                       failure: @escaping (Error) -> Void) {
        
        self.get(getPath("\(period)"),
                 params: [:],
                 failure: { (error) in
                    DispatchQueue.main.async(execute: {
                        failure(error)
                    })
                    
                 }) { (dataResponse, urlResponse) in
            if let json = self.getJSON(dataResponse, failure: failure) {
                DispatchQueue.main.async(execute: {
                    success(NYTMostPopularFeeds(fromDictionary: json as! [String:Any]))
                })
            }
            
        }
    }// End of Get most viewed stories.
}
