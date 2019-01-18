//
//  profileTableViewCell.swift
//  testcustom
//
//  Created by 김지훈 on 18/01/2019.
//  Copyright © 2019 KimJihun. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    @IBOutlet var stargazersCountLabel: UILabel!
    @IBOutlet var watchersCountLabel: UILabel!
    @IBOutlet var createdAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
