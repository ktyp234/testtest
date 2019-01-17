//
//  CustomCell.swift
//  testcustom
//
//  Created by 김지훈 on 18/01/2019.
//  Copyright © 2019 KimJihun. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var userId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
