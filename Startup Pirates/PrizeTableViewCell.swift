//
//  PrizeTableViewCell.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 6/16/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class PrizeTableViewCell: UITableViewCell {
	@IBOutlet weak var prizeImg: UIImageView!
	@IBOutlet weak var lblName: UILabel!
	@IBOutlet weak var lblDescription: UILabel!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
