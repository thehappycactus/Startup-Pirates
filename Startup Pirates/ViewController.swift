//
//  ViewController.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(
			red: CGFloat(191) / 255.0,
			green: CGFloat(231) / 255.0,
			blue: CGFloat(251) / 255.0,
			alpha: CGFloat(1.0))
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func btnShiver_touch(sender: AnyObject) {
		performSegueWithIdentifier("showTabs", sender: nil)
	}

}

