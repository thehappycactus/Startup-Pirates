//
//  CalendarItem.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation

class CalendarItem {
	var title: String
	var details: String
	var startTime: NSDate	// Stored as UTC
	var endTime: NSDate	// Stored as UTC
	var type: CalendarType
	
	init(title: String, details: String, startTime: String, endTime: String, type: Int) {
		self.title = title
		self.details = details
		self.startTime = Date.toDate((startTime as NSString).doubleValue)
		self.endTime = Date.toDate((endTime as NSString).doubleValue)
		self.type = CalendarType(rawValue: type)!
	}
	
	init() {
		self.title = ""
		self.details = ""
		self.startTime = Date.toDate(("1432663414").doubleValue)
		self.endTime = Date.toDate(("1432663414").doubleValue)
		self.type = CalendarType(rawValue: 1)!
	}
	
	enum CalendarType: Int {
		case Pitch = 1, EntrepreneurTalk, LessonsLearned, TeamBuilding, Registration, AskMentor, OpenMeetup, Workshop, Lunch, WorkSession, TeamDefinition
	}

}