//
//  AlertHelperKit.swift
//
//  Created by keygx on 2015/07/17.
//  Copyright (c) 2015年 keygx. All rights reserved.
//

import UIKit

public enum ActionSheetPopoverStyle: Int {
    case Normal = 0
    case BarButton
}

public struct InputField {
    var placeholder: String
    var secure: Bool?
    
    public init(placeholder: String, secure: Bool?) {
        self.placeholder = placeholder
        self.secure = secure
    }
}

public class AlertHelperKit {
    
    public var title: String?
    public var message: String?
    public var cancelButton: String?
    public var destructiveButtons: [String]?
    public var otherButtons: [String]?
    public var disabledButtons: [String]?
    public var sender: AnyObject?
    public var arrowDirection: UIPopoverArrowDirection?
    
    public var animated: Bool = true
    public var completionHandler: (() -> Void)?
    public var popoverStyle: ActionSheetPopoverStyle = .Normal
    
    public var inputFields: [InputField]?
    public var textFields: [AnyObject]?
    
    public init() {
        initialize()
    }
    
    private func initialize() {
        title = nil
        message = nil
        cancelButton = nil
        destructiveButtons = nil
        otherButtons = nil
        sender = nil
        arrowDirection = nil
        animated = true
        completionHandler = nil
        popoverStyle = .Normal
        inputFields = nil
        textFields = nil
    }
    
    // Alert
    public func showAlert(parent: UIViewController, title: String?, message: String?, button: String) {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            // cancel
            let cancelAction = UIAlertAction(title: button, style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            show(parent, ac: alertController)
    }
    
    // Alert with Callback Handler
    public func showAlertWithHandler(parent: UIViewController, style: UIAlertControllerStyle, handler: (Int) -> ()) {
        
        let alertController: UIAlertController = buildAlertController(style) { buttonIndex in
            handler(buttonIndex)
        }
        
        buttonDisabled(alertController)
        
        show(parent, ac: alertController)
    }
    
    // ActionSheet
    public func showActionSheet(parent: UIViewController, style: UIAlertControllerStyle, handler: (Int) -> ()) {
        
        let alertController: UIAlertController = buildAlertController(style) { buttonIndex in
            handler(buttonIndex)
        }
        
        buttonDisabled(alertController)
        
        if let popover = alertController.popoverPresentationController, let sender: AnyObject = sender, let arrowDirection = arrowDirection {
            popover.sourceView = parent.view
            
            switch popoverStyle {
            case .BarButton:
                popover.barButtonItem = sender as! UIBarButtonItem
            default:
                popover.sourceRect = sender.frame
            }
            
            popover.permittedArrowDirections = arrowDirection
        }
        
        show(parent, ac: alertController)
    }
    
    // Build AlertController
    private func buildAlertController(style: UIAlertControllerStyle, handler: (Int) -> ()) -> UIAlertController {
        
        if style == .ActionSheet {
            inputFields = nil
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let destructivOffset = 1
        var othersOffset = destructivOffset
        
        // cancel
        if let cancel = cancelButton {
            let cancelAction = UIAlertAction(title: cancel, style: .Cancel) {
                action in handler(0)
            }
            alertController.addAction(cancelAction)
        }
        
        // destructive
        if let destructive = destructiveButtons {
            for i in 0..<destructive.count {
                let destructiveAction = UIAlertAction(title: destructive[i], style: .Destructive) {
                    action in handler(i + destructivOffset)
                }
                alertController.addAction(destructiveAction)
                
                ++othersOffset
            }
        }
        
        // others
        if let others = otherButtons {
            for i in 0..<others.count {
                let otherAction = UIAlertAction(title: others[i], style: .Default) {
                    action in handler(i + othersOffset)
                }
                alertController.addAction(otherAction)
            }
        }
        
        // textFields
        if let inputFields = inputFields {
            for i in 0..<inputFields.count {
                alertController.addTextFieldWithConfigurationHandler({ textField in
                    // placeholder
                    textField.placeholder = inputFields[i].placeholder
                    // secure
                    if let secure = inputFields[i].secure {
                        textField.secureTextEntry = secure
                    }
                })
            }
        }
        
        return alertController
    }
    
    // Button Disabled
    private func buttonDisabled(alertController: UIAlertController) {
        if let buttons = disabledButtons {
            for alertAction in alertController.actions {
                let action: UIAlertAction = alertAction as! UIAlertAction
                for title in buttons {
                    if action.title == title {
                        action.enabled = false
                    }
                }
            }
        }
    }
    
    // Appear Alert
    private func show(vc: UIViewController, ac: UIAlertController) {
        self.textFields = ac.textFields
        vc.presentViewController(ac, animated: animated, completion: completionHandler)
    }
    
}
