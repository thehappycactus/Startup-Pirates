//
//  ViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	@IBOutlet weak var programPicker: UIPickerView!
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	@IBOutlet weak var btnShiver: UIButton!
	
	var tabs: UITabBarController!
	var pageTab: CalendarPageViewController!
	var guestTab: GuestViewController!
	var prizeTab: PrizeViewController!
	
	var programs: Array<Program> = Array<Program>()
	var selectedProgId: Int = 1
	
	override func viewDidLoad() {
		super.viewDidLoad()
		programs = Services.getProgramList()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return programs.count
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
		return "\(programs[row].city), \(programs[row].country)"
	}
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		selectedProgId = programs[row].id
	}

	@IBAction func btnShiver_touch(sender: AnyObject) {
		var fullAgenda: [Array<AgendaItem>] = [Array<AgendaItem>()]
		var guestList: Array<Guest> = Array<Guest>()
		var prizeList: Array<Prize> = Array<Prize>()
		
		spinner.hidden = false
		btnShiver.hidden = true
	
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
			fullAgenda = Services.getAgenda(self.selectedProgId)
			guestList = Services.getGuests(self.selectedProgId)
			prizeList = Services.getPrizes(self.selectedProgId)
			
			dispatch_async(dispatch_get_main_queue()) {
				self.spinner.stopAnimating()
				self.performSegueWithIdentifier("showTabs", sender: [fullAgenda, guestList, prizeList])
			}
		}
		
		spinner.startAnimating()
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "showTabs") {
			self.tabs = segue.destinationViewController as! UITabBarController
			self.pageTab = self.tabs.viewControllers?.first as! CalendarPageViewController
			self.guestTab = self.tabs.viewControllers?[1] as! GuestViewController
			// self.sponsorTab = self.tabs.viewControllers[2] as! SponsorViewController
			self.prizeTab = self.tabs.viewControllers?[3] as! PrizeViewController
			
			var data = sender as! NSArray
			let agenda = data[0] as! [Array<AgendaItem>]
			let guests = data[1] as! Array<Guest>
			let prizes = data[2] as! Array<Prize>
			
			self.pageTab.fullAgenda = agenda
			self.guestTab.guestList = guests
			self.prizeTab.prizeList = prizes
			
			spinner.stopAnimating()
			btnShiver.hidden = false
		}
	}

}

