//
//  CalendarPageViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/25/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class CalendarPageViewController: UIPageViewController, UIPageViewControllerDataSource {
	//var fullCalendar: Dictionary<Int, Array<CalendarItem>> = Dictionary<Int, Array<CalendarItem>>()
	var fullCalendar = [Array<CalendarItem>()]
	var curDayIdx = 0

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
		
		var curDay = Array<CalendarItem>()
		curDay.append(cal1)
		curDay.append(cal2)
		curDay.append(cal3)
		
		var nextDay = Array<CalendarItem>()
		nextDay.append(cal4)
		nextDay.append(cal5)
		nextDay.append(cal6)
		
		fullCalendar[0] = curDay
		fullCalendar.append(nextDay)
		
		self.dataSource = self
		
		var startVC = viewControllerAtIndex(curDayIdx) as CalendarViewController
		var viewControllers = [startVC]
		
		self.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)

        self.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func viewControllerAtIndex(index: Int) -> CalendarViewController {
        if ((self.fullCalendar.count == 0) || (index >= self.fullCalendar.count)) {
            return CalendarViewController()
        }
        
        var vc: CalendarViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CalendarDay") as! CalendarViewController
        
        vc.curDay = self.fullCalendar[index]
        vc.curDayIdx = index
        
        return vc   
    }
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		let calDay = viewController as! CalendarViewController
		var index = calDay.curDayIdx
		
		if (index == NSNotFound) {
            return nil
        }
        
        index++
        
        if (index == self.fullCalendar.count) {
            return nil
        }
		
		return self.viewControllerAtIndex(index)
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
		let calDay = viewController as! CalendarViewController
		var index = calDay.curDayIdx
		
		if (index == 0 || index == NSNotFound) {
            return nil
        }
		
		index--
		
		return self.viewControllerAtIndex(index)
	}
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
		return self.fullCalendar.count
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
		return 0
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
