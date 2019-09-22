# AlertHelperKit

UIAlertController helper library in Swift

## Requirements
- Swift 5.1
- iOS 8.0 or later

## Installation

### Carthage

```Cartfile
github "keygx/AlertHelperKit"
```

### CocoaPods

```PodFile
pod 'AlertHelperKit', :git => 'https://github.com/keygx/AlertHelperKit'  
```

### Swift versions support

- Swift 5.1, tag "swift5.1"
- Swift 5, tag "swift5"
- Swift 4.2, tag "swift4.2"
- Swift 4.1, tag "swift4.1"
- Swift 4.0, tag "swift4.0"


## Usage

```
import AlertHelperKit
```

### Alert

```ViewController.swift
AlertHelperKit().showAlert(self, title: "Alert", message: "Message", button: "OK")
```
![](images/Alert.png)


### Alert with callback handler

```ViewController.swift
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
```
![](images/AlertWithHandler.png)


### Alert with TextFields

```ViewController.swift
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
```
![](images/AlertWithTextFields.png)


### ActionSheet

```ViewController.swift
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
        println("Cancel: \(buttonIndex)")
    default:
        println("Action: \(buttonIndex)")
    }
}
```
![](images/ActionSheet.png)
![](images/ActionSheet_iPad.png)


### ActionSheet

```ViewController.swift
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
        println("Cancel: \(buttonIndex)")
    default:
        println("Menu: \(buttonIndex)")
    }
}
```
![](images/Menu.png)
![](images/Menu_iPad.png)

## License

AlertHelperKit is released under the MIT license. See LICENSE for details.

## Author

Yukihiko Kagiyama (keygx) <https://twitter.com/keygx>

