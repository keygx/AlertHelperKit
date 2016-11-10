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
    
    @IBAction func btnAlertAction(_ sender: AnyObject) {
        
        AlertHelperKit().showAlert(self, title: "Alert", message: "Message", button: "OK")
    }
    
    @IBAction func btnAlertWithHandlerAction(_ sender: AnyObject) {
        
        let params = Parameters(
            title: "Alert",
            message: "Message",
            cancelButton: "Cancel",
            otherButtons: ["OK"]
        )
        
        AlertHelperKit().showAlertWithHandler(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                print("Cancel: \(buttonIndex)")
            default:
                print("OK: \(buttonIndex)")
            }
        }
    }
    
    @IBAction func btnAlertWithTextFieldsAction(_ sender: AnyObject) {
        
        let params = Parameters(
            title: "Alert",
            message: "Message",
            cancelButton: "Cancel",
            otherButtons: ["OK"],
            inputFields: [InputField(placeholder: "username", secure: false),
                          InputField(placeholder: "password", secure: true)]
        )
        
        let alert = AlertHelperKit()
        alert.showAlertWithHandler(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                print("Cancel: \(buttonIndex)")
            default:
                print("OK: \(buttonIndex)")

                guard let textFields = alert.textFields else {
                    return
                }
                
                // username
                let name: UITextField = textFields[0] as! UITextField
                if name.text!.characters.count > 0 {
                    print(name.text!)
                }
                // password
                let pass: UITextField = textFields[1] as! UITextField
                if pass.text!.characters.count > 0 {
                    print(pass.text!)
                }
            }
        }
    }
    
    @IBAction func btnActionSheetAction(_ sender: AnyObject) {
        
        let params = Parameters(
            cancelButton: "Cancel",
            destructiveButtons: ["Action1"],
            otherButtons: ["Action2", "Action3", "Action4"],
            sender: sender,
            arrowDirection: .up
        )
        
        AlertHelperKit().showActionSheet(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                print("Cancel: \(buttonIndex)")
            default:
                print("Action: \(buttonIndex)")
            }
        }
    }
    
    @IBAction func btnBarMenuAction(_ sender: AnyObject) {
        
        let params = Parameters(
            cancelButton: "Cancel",
            otherButtons: ["Menu1", "Menu2", "Menu3", "Menu4", "Menu5"],
            disabledButtons: ["Menu1", "Menu4"],
            sender: sender,
            arrowDirection: .down,
            popoverStyle: .barButton
        )
        
        AlertHelperKit().showActionSheet(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                print("Cancel: \(buttonIndex)")
            default:
                print("Menu: \(buttonIndex)")
            }
        }
    }
}
