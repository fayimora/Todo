//
//  SecondViewController.swift
//  Todo
//
//  Created by Fayimora Femi-Balogun on 20/03/2016.
//  Copyright © 2016 Fayimora Femi-Balogun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet var item: UITextField!
  
  @IBAction func addItem(sender: UIButton) {
    todoList.append(item.text!)
    item.text = ""
    NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: todoListKey)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    item.resignFirstResponder()
    return true
  }

}

