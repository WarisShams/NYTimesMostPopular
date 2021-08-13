//
//  MasterViewControllerTableViewExtension.swift
//  NYTimesPopular
//
//  Created by Waris on 13/08/2021.
//

import UIKit

// MARK: - Table view data source -
extension MasterViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.popularResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NYTimesPopularTableViewCell.reuseIdentifier, for: indexPath) as! NYTimesPopularTableViewCell

        let data = self.popularResults[indexPath.row]
        cell.cellData = data
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.popularResults[indexPath.row]
        delegate?.mostPopularSelected(data)
        if
            let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
