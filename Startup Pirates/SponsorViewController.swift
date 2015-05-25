//
//  SponsorViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/14/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class SponsorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var sponsorList: Array<Sponsor> = Array<Sponsor>()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		var spons1 = Sponsor(id: 1, name: "Turner Broadcasting", details: "Turner is great", url: "http://turner.com", logo: "", prize: nil, type: 3)
		var spons2 = Sponsor(id: 1, name: "Google For Enrepreneurs", details: "Google is oh so helpful", url: "https://www.googleforentrepreneurs.com/", logo: "", prize: nil, type: 2)
		
		sponsorList.append(spons1)
		sponsorList.append(spons2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sponsorList.count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("SponsorCell", forIndexPath: indexPath) as! SponsorTableViewCell
		
		let sponsor = sponsorList[indexPath.row]
		cell.lblSponsorName.text = sponsor.name
		cell.lblSponsorLevel.text = ""
		cell.imgLogo.image = sponsor.logo
		
		return cell
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
