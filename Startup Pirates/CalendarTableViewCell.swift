
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
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
	
	func setBackgroundColor(type: CalendarItem.CalendarType) {
		var bgColor = UIColor()
		var typeIcon = UIImage()
	
		switch(type) {
		case .Pitch:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(255) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "pitch")!
			break
		case .EntrepreneurTalk:
			bgColor = UIColor(
				red: CGFloat(230) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(245) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "entrepreneur_talk")!
			break
		case .LessonsLearned:
			bgColor = UIColor(
				red: CGFloat(255) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "lessons_learned")!
			break
		case .TeamBuilding:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "team_building")!
			break
		case .Registration:
			bgColor = UIColor(
				red: CGFloat(230) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(245) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "registration")!
			break
		case .AskMentor:
			bgColor = UIColor(
				red: CGFloat(235) / 255.0,
				green: CGFloat(240) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "ask_mentor")!
			break
		case .OpenMeetup:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "open_meetup")!
			break
		case .Workshop:
			bgColor = UIColor(
				red: CGFloat(235) / 255.0,
				green: CGFloat(250) / 255.0,
				blue: CGFloat(255) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "workshop")!
			break
		case .Lunch:
			bgColor = UIColor(
				red: CGFloat(235) / 255.0,
				green: CGFloat(235) / 255.0,
				blue: CGFloat(235) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "lunch")!
			break
		case .WorkSession:
			bgColor = UIColor(
				red: CGFloat(250) / 255.0,
				green: CGFloat(230) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "work_session")!
			break
		case .TeamDefinition:
			bgColor = UIColor(
				red: CGFloat(255) / 255.0,
				green: CGFloat(245) / 255.0,
				blue: CGFloat(230) / 255.0,
				alpha: CGFloat(0.75))
			typeIcon = UIImage(named: "teams")!
			break
		default:
			break
		}
		
		self.viewForBaselineLayout()?.backgroundColor = bgColor
		self.imgTypeIcon.image = typeIcon
	}

}
