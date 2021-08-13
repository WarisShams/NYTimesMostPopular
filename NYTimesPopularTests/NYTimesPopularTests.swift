//
//  NYTimesPopularTests.swift
//  NYTimesPopularTests
//
//  Created by Waris on 12/08/2021.
//

import XCTest
@testable import NYTimesPopular

class NYTimesPopularTests: XCTestCase {
    var masterVC: MasterViewController?
    var detailVC: DetailViewController?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        ServicesManager.ROOT_API = Host.baseUrl
        guard
            let scene = UIApplication.shared.connectedScenes.first,
            let sd : SceneDelegate = scene.delegate as? SceneDelegate,
            let splitViewController = sd.window?.rootViewController as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let masterViewController = leftNavController.viewControllers.first as? MasterViewController,
            let detailViewController = (splitViewController.viewControllers.last as? UINavigationController)?.topViewController as? DetailViewController
        else {
            return
        }
        masterVC = masterViewController
        detailVC = detailViewController
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        masterVC = nil
    }
    
    func testForAPIKeyValid() throws {
        let exp = expectation(description: "Loading stories")
        
        ServicesManager.getMostViewedPosts(period: 7) { (response) in
            XCTAssertEqual(response.results.count, 20, "We should have loaded exactly 20 stories.")
            exp.fulfill()
        } failure: { error in
            XCTFail("Error: Unable to fetch data")
        }
        
        waitForExpectations(timeout: 3)
    }

    func testForRealData() {
        masterVC?.tableView.selectRow(at: IndexPath(row: 1, section: 0), animated: true, scrollPosition: .none)
        
        detailVC?.navigationController?.popViewController(animated: true)
        masterVC?.tableView.selectRow(at: IndexPath(row: 2, section: 0), animated: true, scrollPosition: .none)
    }
}
