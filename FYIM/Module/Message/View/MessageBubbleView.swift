//
//  MessageBubbleView.swift
//  FYIM
//
//  Created by dai.fengyi on 15/7/18.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit

class MessageBubbleView: UIView {
  var message: XHMessage!
  @IBOutlet weak var displayTextView: SETextView?
  @IBOutlet weak var bubbleImageView: UIImageView?
  @IBOutlet weak var emotionImageView: UIImageView?
  @IBOutlet weak var animationVoiceImageView: UIImageView?
  @IBOutlet weak var voiceUnreadDotImageView: UIImageView?
  @IBOutlet weak var bubblePhotoImageView: UIImageView?
  @IBOutlet weak var videoPlayImageView: UIImageView?
  @IBOutlet weak var geolocationsLabel: UILabel?


}
