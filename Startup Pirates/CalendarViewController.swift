//
//  CalendarViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class CalendarViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
	var curDay: Array<CalendarItem> = Array<CalendarItem>()
	var curDayIdx: Int = 0
	
	@IBOutlet weak var lblCalendarDay: UILabel!
	@IBOutlet weak var tblCalendar: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		var bg = UIImageView(image: UIImage(named: "mainBackground")!)
		self.tblCalendar.backgroundView = bg

		lblCalendarDay.text = "Day \(curDayIdx + 1)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return curDay.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("CalendarCell", forIndexPath: indexPath) as! CalendarTableViewCell
		let calItem = curDay[indexPath.row]
		cell.lblItemName.text = calItem.title
		cell.lblStartTime.text = Date.toTimeString(date: calItem.startTime)
		cell.lblEndTime.text = Date.toTimeString(date: calItem.endTime)
		cell.setBackgroundColor(calItem.type)
		
		return cell
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		let calItem = curDay[indexPath.row]
		let cal =  NSCalendar.currentCalendar()
		let unit = NSCalendarUnit.CalendarUnitMinute
		let components = cal.components(unit, fromDate: calItem.startTime, toDate: calItem.endTime, options: nil)
		
		let halfHourUnit = components.minute / 30
		
		return CGFloat(halfHourUnit) * 50.0		// 50px for each half hour
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("ShowCalendarDetail", sender: curDay[indexPath.row])
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "ShowCalendarDetail") {
			var calDetailView = segue.destinationViewController as! CalendarItemDetailViewController
			calDetailView.calItem = sender as! CalendarItem
		}
    }
	

}
