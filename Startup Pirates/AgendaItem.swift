//
//  CalendarItem.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation
import UIKit

class AgendaItem {
	var title: String
	var details: String
	var day: Int
	var startTime: NSDate	// Stored as UTC
	var endTime: NSDate	// Stored as UTC
	var type: AgendaType
	var icon: UIImage!
	
	init(title: String, details: String, day: Int, startTime: String, endTime: String, type: Int) {
		self.title = title
		self.details = details
		self.day = day
		self.startTime = Date.toDateFromUTC(startTime)
		self.endTime = Date.toDateFromUTC(endTime)
		self.type = AgendaType(rawValue: type)!
		self.icon = self.setIcon(self.type)
		
		var comps = NSDateComponents()
		comps.hour = 5
		
		startTime
	}
	
	init() {
		self.title = ""
		self.details = ""
		self.day = 1
		self.startTime = Date.toDate(("1432663414").doubleValue)
		self.endTime = Date.toDate(("1432663414").doubleValue)
		self.type = AgendaType(rawValue: 1)!
		self.icon = self.setIcon(AgendaType.WorkSession)
	}
	
	enum AgendaType: Int {
		case Pitch = 1, EntrepreneurTalk, LessonsLearned, TeamBuilding, Registration, AskMentor, OpenMeetup, Workshop, Meal, WorkSession, TeamDefinition
	}
	
	func setIcon(agendaType: AgendaType) -> UIImage {
		var typeIcon = UIImage()
	
		switch(agendaType) {
		case .Pitch:
			typeIcon = UIImage(named: "pitch")!
			break
		case .EntrepreneurTalk:
			typeIcon = UIImage(named: "entrepreneur_talk")!
			break
		case .LessonsLearned:
			typeIcon = UIImage(named: "lessons_learned")!
			break
		case .TeamBuilding:
			typeIcon = UIImage(named: "team_building")!
			break
		case .Registration:
			typeIcon = UIImage(named: "registration")!
			break
		case .AskMentor:
			typeIcon = UIImage(named: "ask_mentor")!
			break
		case .OpenMeetup:
			typeIcon = UIImage(named: "open_meetup")!
			break
		case .Workshop:
			typeIcon = UIImage(named: "workshop")!
			break
		case .Meal:
			typeIcon = UIImage(named: "lunch")!
			break
		case .WorkSession:
			typeIcon = UIImage(named: "working")!
			break
		case .TeamDefinition:
			typeIcon = UIImage(named: "teams")!
			break
		default:
			typeIcon = UIImage(named: "working")!
			break
		}
		
		return typeIcon
	}

}