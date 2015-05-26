//
//  CalendarDay.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/25/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class CalendarDay: UIView, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet var view: UIView!

	@IBOutlet weak var lblDay: UILabel!
	@IBOutlet weak var lblCalendarDay: UITableView!
	var curDay: Array<CalendarItem> = Array<CalendarItem>()
	var dayNbr = 1
	
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init(coder aDecoder: NSCoder) {
	    super.init(coder: aDecoder)
		
		NSBundle.mainBundle().loadNibNamed("CalendarDay", owner: self, options: nil)
		self.addSubview(view)
		self.lblDay.text = "Day \(dayNbr)"
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("GuestCell", forIndexPath: indexPath) as! CalendarTableViewCell
		let calItem = curDay[indexPath.row]
		cell.lblItemName.text = calItem.title
		cell.lblStartTime.text = Date.toTimeString(date: calItem.startTime)
		cell.lblEndTime.text = Date.toTimeString(date: calItem.endTime)
		cell.setBackgroundColor(calItem.type)
		
		return cell
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return curDay.count
	}

}
