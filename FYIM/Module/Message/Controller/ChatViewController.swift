//
//  ChatViewController.swift
//  FYIM
//
//  Created by dai.fengyi on 15/7/17.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  var messages: NSMutableArray = []
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    loadData()
  }

  func loadData() {
    for var i = 0; i < 10; i++ {
      let msg = XHMessage(text: "\(i). test text test text test text test text test text test text ", sender: "davidear", timestamp: NSDate())
      messages .addObject(msg)
    }
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */
  // MARK: - Table view data source
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return messages.count
  }
  

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! MessageBaseTableViewCell
    cell.message = (messages[indexPath.row] as! XHMessage)
//    if cell == nil {
//      cell = MainTableViewCell()
//    }
    
    // Configure the cell...
    
    return cell
  }

//  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//    return 80
//  }
  
}
