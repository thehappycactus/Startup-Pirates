//
//  SponsorTableViewCell.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/14/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class SponsorTableViewCell: UITableViewCell {
	@IBOutlet weak var lblSponsorName: UILabel!
	@IBOutlet weak var lblSponsorDetails: UILabel!
	@IBOutlet weak var imgLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
