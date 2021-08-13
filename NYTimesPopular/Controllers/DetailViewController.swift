//
//  DetailViewController.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Variables -
    var popularFeed: NYTMostPopularFeeds.Result? {
        didSet {
            setupView()
        }
    }
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private Methods -
    fileprivate func setupView() {
        guard let feed = self.popularFeed,
              let url = URL(string: feed.url) else {
            return
        }
        self.webView.load(URLRequest(url: url))
    }
}

// MARK: - NYMostPopularSelectionDelegate -
extension DetailViewController: NYMostPopularSelectionDelegate {
    func mostPopularSelected(_ newFeed: NYTMostPopularFeeds.Result?) {
        popularFeed = newFeed
    }
}
