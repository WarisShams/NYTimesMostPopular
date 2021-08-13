//
//  Serializer.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import Foundation

public protocol Serializer {
    
    init(fromDictionary dictionary: [String:Any])
    func toDictionary() -> [String:Any]
}
