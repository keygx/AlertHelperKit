//
//  ViewController.swift
//  AlertHelperKitSample
//
//  Created by keygx on 2015/07/21.
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
        
        let params = Parameters(
            title: "Alert",
            message: "Message",
            cancelButton: "Cancel",
            otherButtons: ["OK"]
        )
        
        AlertHelperKit().showAlertWithHandler(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                println("Cancel: \(buttonIndex)")
            default:
                println("OK: \(buttonIndex)")
            }
        }
    }
    
    @IBAction func btnAlertWithTextFieldsAction(sender: AnyObject) {
        
        let params = Parameters(
            title: "Alert",
            message: "Message",
            cancelButton: "Cancel",
            otherButtons: ["OK"],
            inputFields: [InputField(placeholder: "username", secure: false),
                          InputField(placeholder: "password", secure: true)]
        )
        
        var alert = AlertHelperKit()
        alert.showAlertWithHandler(self, parameters: params) { buttonIndex in
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
        
        let params = Parameters(
            cancelButton: "Cancel",
            destructiveButtons: ["Action1"],
            otherButtons: ["Action2", "Action3", "Action4"],
            sender: sender,
            arrowDirection: .Up
        )
        
        AlertHelperKit().showActionSheet(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                println("Cancel: \(buttonIndex)")
            default:
                println("Action: \(buttonIndex)")
            }
        }
    }
    
    @IBAction func btnBarMenuAction(sender: AnyObject) {
        
        let params = Parameters(
            cancelButton: "Cancel",
            otherButtons: ["Menu1", "Menu2", "Menu3", "Menu4", "Menu5"],
            disabledButtons: ["Menu1", "Menu4"],
            sender: sender,
            arrowDirection: .Down,
            popoverStyle: .BarButton
        )
        
        AlertHelperKit().showActionSheet(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                println("Cancel: \(buttonIndex)")
            default:
                println("Menu: \(buttonIndex)")
            }
        }
    }
}
