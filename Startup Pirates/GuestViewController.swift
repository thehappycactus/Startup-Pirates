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
		
		var guest1 = Guest(id: 0, name: "Mike Ames", shortInfo: "The Biz Garage", bio: "Owner of The Biz Garage!", type: 2, imgURL: "http://startup-pirates.s3.amazonaws.com/people/photos/000/000/962/medium/Ames_Profile_Pic.JPG")
		var guest2 = Guest(id: 1, name: "Isabel Marques", shortInfo: "Startup Pirates @ Atlanta", bio: "Organizer of Startup Pirates @Atlanta", type: 1, imgURL: "http://startup-pirates.s3.amazonaws.com/people/photos/000/000/779/medium/isabel.jpg?1427134302")
		var guest3 = Guest(id: 2, name: "Pedro Queiros", shortInfo: "Startup Pirates @ Atlanta", bio: "Organizer of Startup Pirates @ Atlanta", type: 2, imgURL: "http://startup-pirates.s3.amazonaws.com/people/photos/000/000/780/medium/pedro.jpg?1427134360")
		var guest4 = Guest(id: 3, name: "Mary Gezo", shortInfo: "Startup Pirates @ Atlanta",  bio: "Social Media Organizer of Startup Pirates @ Atlanta", type: 3, imgURL: "http://startup-pirates.s3.amazonaws.com/people/photos/000/000/870/medium/maryHeadShot.jpg?1429632973")
		
		guestList.append(guest1)
		guestList.append(guest2)
		guestList.append(guest3)
		guestList.append(guest4)

        // Do any additional setup after loading the view.
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
