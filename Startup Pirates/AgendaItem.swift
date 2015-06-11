//
//  CalendarItem.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation

class AgendaItem {
	var title: String
	var details: String
	var day: Int
	var startTime: NSDate	// Stored as UTC
	var endTime: NSDate	// Stored as UTC
	var type: AgendaType
	
	init(title: String, details: String, day: Int, startTime: String, endTime: String, type: Int) {
		self.title = title
		self.details = details
		self.day = day
		self.startTime = Date.toDate((startTime as NSString).doubleValue)
		self.endTime = Date.toDate((endTime as NSString).doubleValue)
		self.type = AgendaType(rawValue: type)!
	}
	
	init() {
		self.title = ""
		self.details = ""
		self.day = 1
		self.startTime = Date.toDate(("1432663414").doubleValue)
		self.endTime = Date.toDate(("1432663414").doubleValue)
		self.type = AgendaType(rawValue: 1)!
	}
	
	enum AgendaType: Int {
		case Pitch = 1, EntrepreneurTalk, LessonsLearned, TeamBuilding, Registration, AskMentor, OpenMeetup, Workshop, Lunch, WorkSession, TeamDefinition
	}

}