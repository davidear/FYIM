//
//  MessageBubbleView.swift
//  FYIM
//
//  Created by dai.fengyi on 15/7/18.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit
import SnapKit
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
  
  override func awakeFromNib() {
    bubbleImageView?.userInteractionEnabled = true
    
    displayTextView?.backgroundColor = UIColor .clearColor()
//    displayTextView?.selectable = false
//    displayTextView?.lineSpacing = 3.0
//    displayTextView?.showsEditingMenuAutomatically = false
//    displayTextView?.highlighted = false
    
    geolocationsLabel?.numberOfLines = 0
    geolocationsLabel?.lineBreakMode = NSLineBreakMode.ByTruncatingTail
    geolocationsLabel?.textColor = UIColor .whiteColor()
    geolocationsLabel?.backgroundColor = UIColor .clearColor()
//    geolocationsLabel?.font = UIFont .systemFontSize(12)
    
  }
  
  func configureCellWithMessage(message:XHMessage) {
    configureBubbleImageView(message)
    configureMessageDisplayMedia(message)
    
    configureConstraints(message)
  }
  
  private func configureBubbleImageView(message:XHMessage) {
    let currentType = message.messageMediaType
    switch currentType {
    case XHBubbleMessageMediaType.Voice:
      voiceUnreadDotImageView?.hidden = message.isRead
      
    case XHBubbleMessageMediaType.Text:
      fallthrough
    case XHBubbleMessageMediaType.Emotion:
      bubbleImageView?.image = XHMessageBubbleFactory .bubbleImageViewForType(message.bubbleMessageType, style: XHBubbleImageViewStyle.WeChat, meidaType: message.messageMediaType)
      bubbleImageView?.hidden = false
      bubblePhotoImageView?.hidden = true
      
      if currentType == XHBubbleMessageMediaType.Text {
        displayTextView?.hidden = false
        animationVoiceImageView?.hidden = true
        emotionImageView?.hidden = true
      }else {
        displayTextView?.hidden = true
        if currentType == XHBubbleMessageMediaType.Voice {
          animationVoiceImageView?.hidden = false
        }else {
          emotionImageView?.hidden = false
          bubbleImageView?.hidden = true
          animationVoiceImageView?.hidden = true
        }
      }
    case XHBubbleMessageMediaType.Photo:
      fallthrough
    case XHBubbleMessageMediaType.Video:
      fallthrough
    case XHBubbleMessageMediaType.LocalPosition:
      bubblePhotoImageView?.hidden = false
      videoPlayImageView?.hidden = (currentType != XHBubbleMessageMediaType.Video)
      geolocationsLabel?.hidden = (currentType != XHBubbleMessageMediaType.LocalPosition)
      displayTextView?.hidden = true
      bubbleImageView?.hidden = true
      animationVoiceImageView?.hidden = true
      emotionImageView?.hidden = true
    default: break
    }
  }
  
  private func configureMessageDisplayMedia(message:XHMessage) {
    switch message.messageMediaType {
    case XHBubbleMessageMediaType.Text:
      displayTextView?.attributedText = XHMessageBubbleHelper .sharedMessageBubbleHelper() .bubbleAttributtedStringWithText(message.text)
      //need more
      
      //    case XHBubbleMessageMediaType.Photo:
      //      bubblePhotoImageView
    default: break
    }
  }
  
  private func configureConstraints(message:XHMessage) {
    let rect = SETextView .frameRectWithAttributtedString(XHMessageBubbleHelper .sharedMessageBubbleHelper() .bubbleAttributtedStringWithText(message.text), constraintSize: CGSizeMake(UIScreen .mainScreen().bounds.width - 56 - 20, CGFloat(MAXFLOAT)), lineSpacing: 3, paragraphSpacing: 3, font: displayTextView?.font)
//    displayTextView?.bounds = rect
    displayTextView?.snp_makeConstraints({ (make) -> Void in
      make.size.equalTo(rect.size)
    })
//    displayTextView?.snp_width = rect.size.width
//    displayTextView?.snp_height = rect.size.height

  }
}

