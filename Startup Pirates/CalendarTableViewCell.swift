
//
//  CalendarTableViewCell.swift
//  Startup Pirates
//
//  Created by Mary Gezo on 5/12/15.
//  Copyright (c) 2015 Happy Cactus Dev. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
	@IBOutlet weak var lblItemName: UILabel!
	@IBOutlet weak var lblEndTime: UILabel!
	@IBOutlet weak var lblStartTime: UILabel!
	@IBOutlet weak var imgTypeIcon: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
	
	func setBackgroundColor(type: AgendaItem.AgendaType) {
		var bgColor = UIColor()
	
		switch(type) {
		case .Pitch:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(255) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .EntrepreneurTalk:
			bgColor = UIColor(
				red: CGFloat(230) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(245) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .LessonsLearned:
			bgColor = UIColor(
				red: CGFloat(255) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .TeamBuilding:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .Registration:
			bgColor = UIColor(
				red: CGFloat(230) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(245) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .AskMentor:
			bgColor = UIColor(
				red: CGFloat(235) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .OpenMeetup:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .Workshop:
			bgColor = UIColor(
				red: CGFloat(235) / 255.0,
				green: CGFloat(250) / 255.0,
				blue: CGFloat(255) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .Meal:
			bgColor = UIColor(
				red: CGFloat(235) / 255.0,
				green: CGFloat(235) / 255.0,
				blue: CGFloat(235) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .WorkSession:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(230) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			break
		case .TeamDefinition:
			bgColor = UIColor(
				red: CGFloat(255) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			break
		default:
			break
		}
		
		self.viewForBaselineLayout()?.backgroundColor = bgColor
	}

}
