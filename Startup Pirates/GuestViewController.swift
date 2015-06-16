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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1	// maybe 3?  one for each guest type?
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return guestList.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("GuestCell", forIndexPath: indexPath) as! GuestTableViewCell
		
		var guest = guestList[indexPath.row]
		cell.lblGuestName.text = guest.name
		cell.lblGuestDetails.text = guest.shortInfo
		cell.imgGuest.image = guest.image
		cell.setIcon(guest.type)
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("ShowGuestDetail", sender: indexPath)
	}


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "ShowGuestDetail") {
			var guestDetailView = segue.destinationViewController as! GuestDetailViewController
			var idxPath: NSIndexPath = sender as! NSIndexPath
			guestDetailView.guest = guestList[idxPath.row]
		}
	}

}
