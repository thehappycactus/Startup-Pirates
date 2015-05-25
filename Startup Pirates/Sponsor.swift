//
//  Sponsor.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/14/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation
import UIKit

class Sponsor {
	var id: Int
	var name: String
	var details: String
	var url: String
	var logo: UIImage!
	var prize: String!
	var type: SponsorType
	
	init(id: Int, name: String, details: String, url: String, logo: String, prize: String!, type: Int) {
		self.id = id
		self.name = name
		self.details = details
		self.url = url
		self.logo = UIImage(named: logo)
		self.prize = prize
		self.type = SponsorType(rawValue: type)!
	}
	
	enum SponsorType: Int {
		case Silver = 1, Gold, PoweredBy
	}
}