//
//  CalendarViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var fullCalendar: Dictionary<Int, Array<CalendarItem>> = Dictionary<Int, Array<CalendarItem>>()
	var curDay: Array<CalendarItem> = Array<CalendarItem>()
	var curDayIdx: Int = 0
	
	@IBOutlet weak var lblCalendarDay: UILabel!
	@IBOutlet weak var tblCalendar: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		var cal1 = CalendarItem(
			title: "Registration and Introduction",
			details: "blah blah blah",
			startTime: "1431698431",
			endTime: "1431702031",
			type: 5)
		var cal2 = CalendarItem(
			title: "Lunch",
			details: "lunchtime",
			startTime: "1431702031",
			endTime: "1431705631",
			type: 9)
		var cal3 = CalendarItem(
			title: "Team Building",
			details: "team building things",
			startTime: "1431709231",
			endTime: "1431716431",
			type: 4)
		
		var cal4 = CalendarItem(
			title: "Registration and Introduction",
			details: "blah blah blah",
			startTime: "1431698431",
			endTime: "1431702031",
			type: 2)
		var cal5 = CalendarItem(
			title: "Lunch",
			details: "lunchtime",
			startTime: "1431702031",
			endTime: "1431705631",
			type: 8)
		var cal6 = CalendarItem(
			title: "Team Building",
			details: "team building things",
			startTime: "1431709231",
			endTime: "1431716431",
			type: 5)
		
		
		curDay.append(cal1)
		curDay.append(cal2)
		curDay.append(cal3)
		
		var nextDay = Array<CalendarItem>()
		nextDay.append(cal4)
		nextDay.append(cal5)
		nextDay.append(cal6)
		
		fullCalendar[curDayIdx] = curDay
		fullCalendar[curDayIdx + 1] = nextDay
		
		lblCalendarDay.text = "Day \(curDayIdx + 1)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return curDay.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("CalendarCell", forIndexPath: indexPath) as! CalendarTableViewCell
		let calItem = curDay[indexPath.row]
		cell.lblItemName.text = calItem.title
		cell.lblStartTime.text = Date.toTimeString(date: calItem.startTime)
		cell.lblEndTime.text = Date.toTimeString(date: calItem.endTime)
		cell.setBackgroundColor(calItem.type)
		
		return cell
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		let calItem = curDay[indexPath.row]
		let cal =  NSCalendar.currentCalendar()
		let unit = NSCalendarUnit.CalendarUnitMinute
		let components = cal.components(unit, fromDate: calItem.startTime, toDate: calItem.endTime, options: nil)
		
		let halfHourUnit = components.minute / 30
		
		return CGFloat(halfHourUnit) * 50.0		// 50px for each half hour
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("showCalendarDetail", sender: curDay[indexPath.row])
	}
	
	
	
	@IBAction func swipeRight_touch(sender: UISwipeGestureRecognizer) {
		println("swipe right: curDayIdx = \(curDayIdx + 1)")
		
		if (curDayIdx > 0) {
			curDayIdx--
			curDay = self.fullCalendar[curDayIdx]!
		}
		
		tblCalendar.reloadData()
		lblCalendarDay.text = "Day \(curDayIdx)"
	}

	@IBAction func swipeLeft_touch(sender: UISwipeGestureRecognizer) {
		println("swipe left: curDayIdx = \(curDayIdx)")
		println("full calendar length: \(fullCalendar.count)")
		
		if (curDayIdx < self.fullCalendar.count - 1) {
			curDayIdx++
			curDay = self.fullCalendar[curDayIdx]!
		}
		
		tblCalendar.reloadData()
		lblCalendarDay.text = "Day \(curDayIdx + 1)"
	}
	
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		if (segue.identifier == "showCalendarDetail") {
			
		}
    }
	

}
