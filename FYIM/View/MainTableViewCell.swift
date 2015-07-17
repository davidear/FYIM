//
//  MainTableViewCell.swift
//  FYIM
//
//  Created by dai.fengyi on 15/7/17.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

  @IBOutlet weak var avatar: UIImageView!
  @IBOutlet weak var upLabel: UILabel!
  @IBOutlet weak var bottomLabel: UILabel!
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}
