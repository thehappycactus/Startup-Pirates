//
//  SponsorDetailViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/15/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class SponsorDetailViewController: UIViewController {
	@IBOutlet weak var imgLogo: UIImageView!
	@IBOutlet weak var lblName: UILabel!
	@IBOutlet weak var lblLevel: UILabel!
	@IBOutlet weak var lblPrize: UILabel!
	@IBOutlet weak var lblBio: UILabel!
	
	var sponsor: Sponsor! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = sponsor.name
		lblBio.text = sponsor.details
		imgLogo.image = sponsor.logo
		
		if (sponsor.prize != nil) {
			lblPrize.text = "Prize: \(sponsor.prize)"
		} else {
			lblPrize.text = "Prize: None"
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func btnBack_touch(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
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
