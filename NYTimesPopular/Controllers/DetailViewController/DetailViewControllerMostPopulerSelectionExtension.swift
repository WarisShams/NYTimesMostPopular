//
//  DetailViewControllerMostPopulerSelectionExtension.swift
//  NYTimesPopular
//
//  Created by Waris on 13/08/2021.
//

import Foundation

// MARK: - NYMostPopularSelectionDelegate -
extension DetailViewController: NYMostPopularSelectionDelegate {
    func mostPopularSelected(_ newFeed: NYTMostPopularFeeds.Result?) {
        popularFeed = newFeed
    }
}
