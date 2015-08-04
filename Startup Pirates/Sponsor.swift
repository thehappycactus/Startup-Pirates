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
	var shortDesc: String
	var longDesc: String
	var url: String
	var logo: UIImage!
	
	init(id: Int, name: String, shortDesc: String, longDesc: String, url: String, logo: String) {
		self.id = id
		self.name = name
		self.shortDesc = shortDesc
		self.longDesc = longDesc
		self.url = url
		
		let data = NSData(contentsOfURL: NSURL(string: logo)!)
		self.logo = UIImage(data: data!)
	}
}