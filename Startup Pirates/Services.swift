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
	
	class func getAgenda(programId: Int) -> [Array<AgendaItem>] {
		var fullUrl = "\(url)/programs/\(programId)/agenda"
		var agendaArr = Array<Array<AgendaItem>>()
		var agendaDayArr = Array<AgendaItem>()
		
		var request: NSMutableURLRequest = NSMutableURLRequest()
		request.URL = NSURL(string: fullUrl)
		request.HTTPMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		
		var data: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: NSErrorPointer())
		
		let json = JSON(data: data)
		for (key: String, subJson: JSON) in json {
			for (subKey: String, finalJson: JSON) in subJson {
				var item = AgendaItem(
					title: finalJson["title"].stringValue,
					details: finalJson["details"].stringValue,
					day: finalJson["day"].intValue,
					startTime: finalJson["start_time"].stringValue,
					endTime: finalJson["end_time"].stringValue,
					type: finalJson["agenda_type"].intValue)
				
				agendaDayArr.append(item)
			}
			
			agendaArr.append(agendaDayArr)
			agendaDayArr = Array<AgendaItem>()
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
			var name = subJson["f_name"].stringValue + " " + subJson["l_name"].stringValue
			var guest = Guest(
				id: subJson["id"].intValue,
				name: name, shortInfo:
				subJson["short_info"].stringValue,
				bio: subJson["long_info"].stringValue,
				type: subJson["guest_type"].intValue,
				imgURL: subJson["img_loc"].stringValue)
			
			guestArr.append(guest)
		}
		
		return guestArr
	}
	
	class func getPrizes(programId: Int) -> Array<Guest> {
		var fullUrl = "\(url)/programs/\(programId)/prize"
		var guestArr = Array<Prize>()
		
		var request: NSMutableURLRequest = NSMutableURLRequest()
		request.URL = NSURL(string: fullUrl)
		request.HTTPMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		
		var data: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: NSErrorPointer())
		
		let json = JSON(data: data)
		
		for (key: String, subJson: JSON) in json {
			var name = subJson["f_name"].stringValue + " " + subJson["l_name"].stringValue
			var guest = Prize(
				id: subJson["id"].intValue,
				shortDesc: subJson["short_desc"].stringValue,
				longDes: subJson["long_desc"].stringValue,
				name: subJson["name"].stringValue,
				imgURL: subJson["img_loc"].stringValue,
				url: subJson["url"].stringValue)
			
			prizeArr.append(guest)
		}
		
		return prizeArr
	}

}