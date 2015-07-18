//
//  ViewController.swift
//  AlertHelperKitSample
//
//  Created by keygx on 2015/07/18.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit
import AlertHelperKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnAlertAction(sender: AnyObject) {
        
        AlertHelperKit().showAlert(self, title: "Alert", message: "Message", button: "OK")
    }
    
    @IBAction func btnAlertWithHandlerAction(sender: AnyObject) {
        
        var alert = AlertHelperKit()
        alert.title = "Alert"
        alert.message = "Message"
        alert.cancelButton = "Cancel"
        alert.otherButtons = ["OK"]
        /*alert.completionHandler = {
        println("View Alert")
        }*/
        
        alert.showAlertWithHandler(self) { buttonIndex in
            switch buttonIndex {
            case 0:
                println("Cancel: \(buttonIndex)")
            default:
                println("OK: \(buttonIndex)")
            }
        }
    }
    
    @IBAction func btnAlertWithTextFieldsAction(sender: AnyObject) {
        
        var alert = AlertHelperKit()
        alert.title = "Alert"
        alert.message = "Message"
        alert.cancelButton = "Cancel"
        alert.otherButtons = ["OK"]
        alert.inputFields = [InputField(placeholder: "username", secure: false), InputField(placeholder: "password", secure: true)]
        
        alert.showAlertWithHandler(self) { buttonIndex in
            switch buttonIndex {
            case 0:
                println("Cancel: \(buttonIndex)")
            default:
                println("OK: \(buttonIndex)")
                
                if let textFields = alert.textFields {
                    // username
                    let name: UITextField = textFields[0] as! UITextField
                    if count(name.text) > 0 {
                        println(name.text)
                    }
                    // password
                    let pass: UITextField = textFields[1] as! UITextField
                    if count(pass.text) > 0 {
                        println(pass.text)
                    }
                }
            }
        }
    }
    
    @IBAction func btnActionSheetAction(sender: AnyObject) {
        
        var sheet = AlertHelperKit()
        sheet.cancelButton = "Cancel"
        sheet.destructiveButtons = ["Action1"]
        sheet.otherButtons = ["Action2", "Action3", "Action4"]
        sheet.sender = sender
        sheet.arrowDirection = .Up
        
        sheet.showActionSheet(self) { buttonIndex in
            switch buttonIndex {
            case 0:
                println("Cancel: \(buttonIndex)")
            default:
                println("Action: \(buttonIndex)")
            }
        }
    }
    
    @IBAction func btnBarMenuAction(sender: AnyObject) {
        
        var sheet = AlertHelperKit()
        sheet.cancelButton = "Cancel"
        sheet.otherButtons = ["Menu1", "Menu2", "Menu3", "Menu4", "Menu5"]
        sheet.disabledButtons = ["Menu1", "Menu4"]
        sheet.sender = sender
        sheet.arrowDirection = .Down
        sheet.popoverStyle = .BarButton
        
        sheet.showActionSheet(self) { buttonIndex in
            switch buttonIndex {
            case 0:
                println("Cancel: \(buttonIndex)")
            default:
                println("Menu: \(buttonIndex)")
            }
        }
    }
}
