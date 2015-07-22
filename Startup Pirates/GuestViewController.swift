//
//  GuestViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/13/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class GuestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var guestList: Array<Guest> = Array<Guest>()
	var filteredList: Array<Guest> = Array<Guest>()
	
	@IBOutlet weak var ctrlFilter: UISegmentedControl!
	@IBOutlet weak var tblGuests: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Must render images as "Always Original" in order to be displayed correctly in segmented control
		var imgSpeakers = UIImage(named: "speakers")?.imageWithRenderingMode(.AlwaysOriginal)
		var imgMentors = UIImage(named: "mentors")?.imageWithRenderingMode(.AlwaysOriginal)
		var imgJudges = UIImage(named: "judges")?.imageWithRenderingMode(.AlwaysOriginal)
		
		ctrlFilter.setImage(imgSpeakers, forSegmentAtIndex: 1)
		ctrlFilter.setImage(imgMentors, forSegmentAtIndex: 2)
		ctrlFilter.setImage(imgJudges, forSegmentAtIndex: 3)
		
		ctrlFilter.selectedSegmentIndex = 0		// Filter defaults to "All"
		filteredList = guestList				// Init the filteredList to be the full guestList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1	// maybe 3?  one for each guest type?
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredList.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("GuestCell", forIndexPath: indexPath) as! GuestTableViewCell
		
		var guest = filteredList[indexPath.row]
		cell.lblGuestName.text = guest.name
		cell.lblGuestDetails.text = guest.shortInfo
		cell.imgGuest.image = guest.image
		cell.setIcon(guest.type)
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("ShowGuestDetail", sender: indexPath)
	}
	
	
	@IBAction func ctrlFilter_changed(sender: UISegmentedControl) {
		switch ctrlFilter.selectedSegmentIndex {
			case 0:
				filteredList = guestList
			case 1:
				filteredList = guestList.filter(isSpeaker)
			case 2:
				filteredList = guestList.filter(isMentor)
			case 3:
				filteredList = guestList.filter(isJudge)
			default:
				filteredList = guestList
		}
		
		self.tblGuests.reloadData()
	}
	
	func isMentor(guests: Guest) -> Bool {
		if (guests.type == Guest.GuestType.Mentor) {
			return true
		} else {
			return false
		}
	}
	
	func isSpeaker(guests: Guest) -> Bool {
		if (guests.type == Guest.GuestType.Speaker) {
			return true
		} else {
			return false
		}
	}
	
	func isJudge(guests: Guest) -> Bool {
		if (guests.type == Guest.GuestType.Judge) {
			return true
		} else {
			return false
		}
	}


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "ShowGuestDetail") {
			var guestDetailView = segue.destinationViewController as! GuestDetailViewController
			var idxPath: NSIndexPath = sender as! NSIndexPath
			guestDetailView.guest = filteredList[idxPath.row]
		}
	}

}
