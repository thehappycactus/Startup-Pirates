//
//  Guest.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/13/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation
import UIKit

class Guest {
	var id: Int
	var name: String
	var shortInfo: String
	var bio: String
	var image: UIImage!
	var type: GuestType
	
	init(id: Int, name: String, shortInfo: String, bio: String, type: Int, imgURL: String) {
		self.id = id
		self.name = name
		self.shortInfo = shortInfo
		self.bio = bio
		self.type = GuestType(rawValue: type)!
		
		let data = NSData(contentsOfURL: NSURL(string: imgURL)!)
		self.image = UIImage(data: data!)
	}

	enum GuestType: Int {
		case Speaker = 1, Mentor, Judge
	}

}