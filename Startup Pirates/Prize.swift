//
//  Prize.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 6/16/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation
import UIKit

class Prize {
	var id: Int
	var shortDesc: String
	var longDesc: String
	var name: String
	var imgLoc: UIImage!
	var url: String
	
	init(id: Int, shortDesc: String, longDesc: String, name: String, imgLoc: String, url: String) {
		self.id = id
		self.shortDesc = shortDesc
		self.longDesc = longDesc
		self.name = name
		self.url = url
		
		let data = NSData(contentsOfURL: NSURL(string: imgLoc)!)
		self.imgLoc = UIImage(data: data!)
	}
}