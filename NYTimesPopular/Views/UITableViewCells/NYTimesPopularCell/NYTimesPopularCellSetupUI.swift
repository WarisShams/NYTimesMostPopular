//
//  NYTimesPopularCellSetupUI.swift
//  NYTimesPopular
//
//  Created by Waris on 13/08/2021.
//

import Foundation

extension NYTimesPopularTableViewCell: SetupUIProtocol {
    func setupView() {
        lblTitle.text = cellData.title
        lblAuthor.text = cellData.byline
        btnDate.setTitle(cellData.publishedDate, for: .normal)
    }
}
