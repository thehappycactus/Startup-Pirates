//
//  PrizeDetailViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 6/24/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class PrizeDetailViewController: UIViewController {
	@IBOutlet weak var lblPrizeText: UILabel!
	@IBOutlet weak var lblPrizeGiver: UILabel!
	@IBOutlet weak var lblBio: UILabel!
	@IBOutlet weak var imgLogo: UIImageView!
	@IBOutlet weak var btnUrl: UIButton!
	
	var prize: Prize! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
		
		lblPrizeText.text = prize.shortDesc
		lblPrizeGiver.text = prize.name
		btnUrl.setTitle(prize.url, forState: .Normal)
		lblBio.text = prize.longDesc
		imgLogo.image = prize.imgLoc
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	@IBAction func btnBack_touch(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	@IBAction func btnUrl_touch(sender: UIButton) {
		let targetUrl = NSURL(string: prize.url)
		let app = UIApplication.sharedApplication()
		app.openURL(targetUrl!)
	}
	

}
