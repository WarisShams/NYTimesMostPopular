//
//  DetailViewControllerSetupUI.swift
//  NYTimesPopular
//
//  Created by Waris on 13/08/2021.
//

import Foundation

// MARK: - SetupUIProtocol -
extension DetailViewController: SetupUIProtocol {
    func setupView() {
        guard let feed = self.popularFeed,
              let url = URL(string: feed.url) else {
            return
        }
        self.webView.load(URLRequest(url: url))
    }
}
