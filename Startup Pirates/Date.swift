//
//  File.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/13/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation

class Date {

	// # - A reminder that this parameter is an int
	// Convert Year/Month/Day ints to NSDate
	class func from (#year: Int, month: Int, day: Int) -> NSDate {
		
		var components = NSDateComponents()
		components.year = year
		components.month = month
		components.day = day
		
		// Must specify the calendar type before being able to make a date
		var gregorian = NSCalendar(identifier: NSGregorianCalendar)
		var date = gregorian?.dateFromComponents(components)
		
		return date!
	}

	class func toDateFromUTC(dateString: String) -> NSDate {
		let timeFormat = NSDateFormatter()
		timeFormat.timeZone = NSTimeZone(name: "America/New_York")
		timeFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
		let date = timeFormat.dateFromString(dateString)

		return date!
	}
	
	// Convert UTC Date to NSDate
	class func toDate(dateDub: Double) -> NSDate {
		return NSDate(timeIntervalSince1970: NSTimeInterval(dateDub))
	}
	
	class func toString(#date: NSDate) -> String {
		let dateStringFormatter = NSDateFormatter()
		dateStringFormatter.dateFormat = "yyyy-MM-dd"
		
		return dateStringFormatter.stringFromDate(date)
	}
	
	class func toTimeString(#date: NSDate) -> String {
		var newDate = date.dateByAddingTimeInterval(-60*240)	// Quick hack to fix timezone
		
		let timeStringFormatter = NSDateFormatter()
		timeStringFormatter.dateFormat = "HH:mm"
		return timeStringFormatter.stringFromDate(newDate)
	}
	
}