//
//  MasterViewController.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import UIKit

class MasterViewController: UITableViewController {

    // MARK: - IBOutlet -
    
    // MARK: - Variables -
    var popularResults: [NYTMostPopularFeeds.Result] = []
    var delegate: NYMostPopularSelectionDelegate?
    
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Helper Functions -
    @objc func showMoreOptions() {
        let alert = UIAlertController.init(title: nil, message: "Select Period", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction.init(title: "1", style: .default) { [weak self] (UIAlertAction) in
            self?.getPopularFeed(1)
        })
        
        alert.addAction(UIAlertAction.init(title: "7", style: .default) { [weak self] (UIAlertAction) in
            self?.getPopularFeed(7)
        })
        
        alert.addAction(UIAlertAction.init(title: "30", style: .default) { [weak self] (UIAlertAction) in
            self?.getPopularFeed(30)
        })
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel) { (UIAlertAction) in
            
        })
        
        self.presentAlertView(alert)
    }
    
    // MARK: - API Methods -
    func getPopularFeed(_ period: Int) {
        self.showLoadingActivity()
        ServicesManager.getMostViewedPosts(period: period) { [weak self] (response) in
            
            self?.hideLoadingActivity()
            self?.popularResults = response.results
            self?.delegate?.mostPopularSelected(response.results.first)
            self?.tableView.reloadData()
            
        } failure: {[weak self] (error) in
            self?.hideLoadingActivity()
            self?.showToast(error.localizedDescription)
        }

    }
}
