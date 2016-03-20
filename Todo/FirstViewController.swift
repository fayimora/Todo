//
//  FirstViewController.swift
//  Todo
//
//  Created by Fayimora Femi-Balogun on 20/03/2016.
//  Copyright © 2016 Fayimora Femi-Balogun. All rights reserved.
//

import UIKit

var todoList = [String]()
var todoListKey = "todoList"

class FirstViewController: UIViewController, UITableViewDelegate {

  @IBOutlet var todoListTable: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if NSUserDefaults.standardUserDefaults().objectForKey(todoListKey) != nil {
      todoList = NSUserDefaults.standardUserDefaults().objectForKey(todoListKey) as! [String]
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    todoListTable.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoList.count
  }
  
  // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
  // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    cell.textLabel?.text = todoList[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
      todoList.removeAtIndex(indexPath.row)
      NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: todoListKey)
      todoListTable.reloadData()
    }
  }

}

