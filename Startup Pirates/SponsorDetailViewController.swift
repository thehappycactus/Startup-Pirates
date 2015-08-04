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
	@IBOutlet weak var lblBio: UILabel!
	@IBOutlet weak var btnUrl: UIButton!
	
	var sponsor: Sponsor! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = sponsor.name
		lblBio.text = sponsor.longDesc
		imgLogo.image = sponsor.logo
		
		var smallUrlLength = count(sponsor.url) - 7		// url with "http://" removed
		btnUrl.setTitle(suffix(sponsor.url, smallUrlLength), forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func btnURL_touch(sender: AnyObject) {
		let targetUrl = NSURL(string: sponsor.url)
		let app = UIApplication.sharedApplication()
		app.openURL(targetUrl!)
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
