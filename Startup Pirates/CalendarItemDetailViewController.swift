//
//  CalendarItemDetailViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/26/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class CalendarItemDetailViewController: UIViewController {
	@IBOutlet weak var imgIcon: UIImageView!
	@IBOutlet weak var lblTitle: UILabel!
	@IBOutlet weak var lblDescription: UILabel!
	@IBOutlet weak var lblStartEndTimes: UILabel!
	
	var calItem: AgendaItem = AgendaItem()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		lblTitle.text = calItem.title
		lblDescription.text = calItem.details
		lblStartEndTimes.text = "\(Date.toTimeString(date: calItem.startTime)) - \(Date.toTimeString(date: calItem.endTime))"
		lblDescription.text = calItem.details
		imgIcon.image = calItem.icon

        // Do any additional setup after loading the view.
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
