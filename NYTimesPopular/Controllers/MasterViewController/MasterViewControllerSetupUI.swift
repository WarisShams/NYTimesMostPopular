//
//  MasterViewControllerSetupUI.swift
//  NYTimesPopular
//
//  Created by Waris on 13/08/2021.
//

import UIKit

extension MasterViewController: SetupUIProtocol {
    func setupView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more"), style: .done, target: self, action: #selector(showMoreOptions))
    }
    
    func setupTableView() {
        self.tableView.register(NYTimesPopularTableViewCell.nib, forCellReuseIdentifier: NYTimesPopularTableViewCell.reuseIdentifier)
        self.tableView.tableFooterView = UIView()
        self.getPopularFeed(1)
    }
}
