//
//  SetupUIProtocol.swift
//  NYTimesPopular
//
//  Created by Waris on 13/08/2021.
//

import Foundation

@objc protocol SetupUIProtocol {
    @objc optional func setupView()
    @objc optional func setupTableView()
}
