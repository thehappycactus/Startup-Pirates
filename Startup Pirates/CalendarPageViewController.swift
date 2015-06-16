//
//  CalendarPageViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/25/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class CalendarPageViewController: UIPageViewController, UIPageViewControllerDataSource {
	var fullAgenda = Array<Array<AgendaItem>>()
	var curDayIdx = 0

    override func viewDidLoad() {
        super.viewDidLoad()
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
        if ((self.fullAgenda.count == 0) || (index >= self.fullAgenda.count)) {
            return CalendarViewController()
        }
        
        var vc: CalendarViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CalendarDay") as! CalendarViewController
        
        vc.curDay = self.fullAgenda[index]
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
        
        if (index == self.fullAgenda.count) {
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
		return self.fullAgenda.count
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
