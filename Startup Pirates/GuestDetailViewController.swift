//
//  GuestDetailViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/15/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class GuestDetailViewController: UIViewController {
	@IBOutlet weak var imgGuest: UIImageView!
	@IBOutlet weak var imgTypeIcon: UIImageView!
	@IBOutlet weak var lblName: UILabel!
	@IBOutlet weak var lblShortInfo: UILabel!
	@IBOutlet weak var lblBio: UILabel!
	
	var guest: Guest! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = guest.name
		lblBio.text = guest.bio
		imgGuest.image = guest.image
		
		setupTypeInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func setupTypeInfo() {
		switch(guest.type) {
		case .Speaker:
			imgTypeIcon.image = UIImage(named: "speakers")
			lblShortInfo.text = "Speaker"
			break
		case .Mentor:
			imgTypeIcon.image = UIImage(named: "mentors")
			lblShortInfo.text = "Mentor"
			break
		case .Judge:
			imgTypeIcon.image = UIImage(named: "judges")
			lblShortInfo.text = "Judge"
			break
		}
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
