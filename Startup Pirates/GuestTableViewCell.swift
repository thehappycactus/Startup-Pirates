//
//  GuestTableViewCell.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/13/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class GuestTableViewCell: UITableViewCell {
	@IBOutlet weak var lblGuestName: UILabel!
	@IBOutlet weak var lblGuestDetails: UILabel!
	@IBOutlet weak var imgGuest: UIImageView!
	@IBOutlet weak var imgGuestIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setIcon(type: Guest.GuestType) {
		var icon = UIImage()
		
		switch (type) {
		case .Speaker:
			icon = UIImage(named: "speakers")!
			break
		case .Mentor:
			icon = UIImage(named: "mentors")!
			break
		case .Judge:
			icon = UIImage(named: "judges")!
			break
		default:
			break
		}
		
		self.imgGuestIcon.image = icon
	}

}
