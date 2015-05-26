//
//  MoreViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/25/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func btnChangePrograms_touch(sender: UIButton) {
		let alert = UIAlertController(title: "Program Change", message: "Are you sure you want to switch Startup Pirates programs?", preferredStyle: UIAlertControllerStyle.Alert)
		
		alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil))
		alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default,
			handler: { (action) -> Void in
				self.dismissViewControllerAnimated(true, completion: nil)
		}))
		
		self.presentViewController(alert, animated: true, completion: nil)
	}
	
	@IBAction func swchAgendaAlerts_change(sender: UISwitch) {
		// Set some sort of global that removes/adds alerts before a new item on the agenda
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
