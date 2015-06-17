//
//  PrizeViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 6/16/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class PrizeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	var prizeList: Array<Prize> = Array<Prize>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return prizeList.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("PrizeCell", forIndexPath: indexPath) as! PrizeTableViewCell
		cell.prizeImg!.image = prizeList[indexPath.row].imgLoc
		cell.lblName.text = prizeList[indexPath.row].name
		cell.lblDescription.text = prizeList[indexPath.row].shortDesc
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
