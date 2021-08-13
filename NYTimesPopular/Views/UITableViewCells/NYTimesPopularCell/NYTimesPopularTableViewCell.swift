//
//  NYTimesPopularTableViewCell.swift
//  NYTimesPopular
//
//  Created by Waris on 13/08/2021.
//

import UIKit

class NYTimesPopularTableViewCell: UITableViewCell {

    // MARK: - IBOutlet -
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    @IBOutlet weak var btnDate: UIButton!
    
    
    // MARK: - Variables -
    var cellData: NYTMostPopularFeeds.Result! {
        didSet {
            setupView()
        }
    }
    
    static var reuseIdentifier = String(describing: NYTimesPopularTableViewCell.self)
    static var nib: UINib? = UINib(nibName: String(describing: NYTimesPopularTableViewCell.self), bundle: nil)
    
    // MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
