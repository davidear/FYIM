//
//  MessageBaseTableViewCell.swift
//  FYIM
//
//  Created by dai.fengyi on 15/7/17.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit

class MessageBaseTableViewCell: UITableViewCell {
  @IBOutlet weak var avatar: UIButton!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var timestamp: UILabel!
  @IBOutlet weak var messageBubbleView: MessageBubbleView!

  var displayTimestamp: Bool! = false
  
  //DATA
  var message: XHMessage? {
    didSet(oldValue) {
      configureAvatar(message!)
      configureTimestamp(true, message: message!)
      configureUserName(message!)
      configureBubbleView(message!)
    }
  }
  
  //MARK:- Cell Configuration
  func configureTimestamp(displayTimestamp: Bool, message:  XHMessage) {
    self.displayTimestamp = displayTimestamp
    self.timestamp.hidden = !self.displayTimestamp
    if displayTimestamp {
      avatar .setImage(message.avatar, forState: UIControlState.Normal)
      userName.text = message.sender
      let today = NSDate()
      let components = NSDateComponents()
      components.day = -1
      let yesterday = NSCalendar .currentCalendar() .dateByAddingComponents(components, toDate: today, options: NSCalendarOptions.allZeros)

      let dateComponents = NSCalendar.currentCalendar() .components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: message.timestamp)
      let todayComponents = NSCalendar.currentCalendar() .components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: today)
      let yesterdayComponents = NSCalendar.currentCalendar() .components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: yesterday!)
      
      var dateText : String!
      if dateComponents.year == todayComponents.year && dateComponents.month == todayComponents.month && dateComponents.day == todayComponents.day {
        dateText = "今天"
      }else if dateComponents.year == yesterdayComponents.year && dateComponents.month == yesterdayComponents.month && dateComponents.day == yesterdayComponents.day {
        dateText = "昨天"
      }else {
        dateText = NSDateFormatter .localizedStringFromDate(message.timestamp, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
      }
      let timeText = NSDateFormatter .localizedStringFromDate(message.timestamp, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
      timestamp.text = "\(dateText)\(timeText)"
    }
  }
  
  func configureAvatar(message: XHMessage) {
    if let avatarPhoto = message.avatar {
      self.avatar .setImage(avatarPhoto, forState: UIControlState.Normal)
      if let avatarURL = message.avatarUrl {
        //need to download from network
      }
    }else if let avatarURL = message.avatarUrl {
      //need to download from network
    }else {
      self.avatar .setBackgroundImage(UIImage(named: "avatar"), forState: UIControlState.Normal)
    }
  }
  
//  func config
  
  func configureUserName(message: XHMessage) {
    self.userName.text = message.sender
  }
  
  func configureBubbleView(message: XHMessage) {
//    let currentMediaType = message.messageMediaType
//    for gestureRecognizer in self.messageBubbleView.b
  }
  
  //MARK:-
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}
