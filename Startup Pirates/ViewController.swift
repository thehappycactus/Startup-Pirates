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
	var programs: Array<Program> = Array<Program>()
	var selectedProgId: Int = 0
	
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
		selectedProgId = row
	}

	@IBAction func btnShiver_touch(sender: AnyObject) {
		var agendaArr: Array<AgendaItem> = Services.getAgenda(selectedProgId)
		var fullAgenda: [Array<AgendaItem>] = [Array<AgendaItem>()]
		
		var curDay = 0
		var agendaDay: Array<AgendaItem>
		for item in agendaArr {
			if (curDay != item.day) {
				agendaDay = Array<AgendaItem>()
			}
			
			
		}
		
		performSegueWithIdentifier("showTabs", sender: agendaArr)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "showTabs") {
			var tabView = segue.destinationViewController as! CalendarPageViewController
			let agenda = sender as! Array<AgendaItem>
			tabView.fullAgenda = [agenda]
		}
	}

}

