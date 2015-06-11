//
//  Services.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 6/9/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import Foundation

class Services {
	static var url = "http://happycactusdev.com/sp-api"
	
	class func getProgramList() -> Array<Program> {
		var fullUrl = "\(url)/programs"
		var programArr = Array<Program>()
	
		var request: NSMutableURLRequest = NSMutableURLRequest()
		request.URL = NSURL(string: fullUrl)
		request.HTTPMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		
		var data: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: NSErrorPointer())
		
		let json = JSON(data: data)
		
		for (key: String, subJson: JSON) in json {
			var program = Program(
				id: subJson["id"].intValue,
				lang: subJson["lang"].stringValue,
				date: subJson["date"].stringValue,
				city: subJson["city"].stringValue,
				country: subJson["country"].stringValue)
			
			programArr.append(program)
		}
	
		return programArr
	}
	
	class func getAgenda(programId: Int) -> Array<AgendaItem> {
		var fullUrl = ""
		var agendaArr = Array<AgendaItem>()
		
		var request: NSMutableURLRequest = NSMutableURLRequest()
		request.URL = NSURL(string: fullUrl)
		request.HTTPMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		
		var data: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: NSErrorPointer())
		
		let json = JSON(data: data)
		for (key: String, subJson: JSON) in json {
			var item = AgendaItem(
				title: subJson["title"].stringValue,
				details: subJson["details"].stringValue,
				day: subJson["day"].intValue,
				startTime: subJson["startTime"].stringValue,
				endTime: subJson["endTime"].stringValue,
				type: subJson["type"].intValue)
			
			agendaArr.append(item)
		}
		
		return agendaArr
	}
	
	class func getGuests(programId: Int) -> Array<Guest> {
		var fullUrl = "\(url)/programs/\(programId)/guests"
		var guestArr = Array<Guest>()
		
		var request: NSMutableURLRequest = NSMutableURLRequest()
		request.URL = NSURL(string: fullUrl)
		request.HTTPMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		
		var data: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: NSErrorPointer())
		
		let json = JSON(data: data)
		
		for (key: String, subJson: JSON) in json {
			var name = subJson["fName"].stringValue + subJson["lName"].stringValue
			var guest = Guest(
				id: subJson["id"].intValue,
				name: name, shortInfo:
				subJson["shortInfo"].stringValue,
				bio: subJson["longInfo"].stringValue,
				type: subJson["type"].intValue,
				imgURL: subJson["img_loc"].stringValue)
			
			guestArr.append(guest)
		}
		
		return guestArr
	}

}