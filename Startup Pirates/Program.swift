//
//  Program.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 6/9/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation

class Program {
	var id: Int
	var lang: String
	var date: NSDate
	var city: String
	var country: String
	
	init(id: Int, lang: String, date: String, city: String, country: String) {
		self.id = id
		self.lang = lang
		self.date = Date.toDate((date as NSString).doubleValue)
		self.city = city
		self.country = country
	}
}