//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

//protocol TextFieldToPickerViewDelegate: class {
//    func buttonPressedToPopulatePickerView()
//}


enum PropertyKeys: String {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Height Multiplier"
    case horizontalMultiplier = "Horizontal Multiplier"
    case verticalOffSet = "Vertical Offset"
    case numberOfFlips = "Number Of Flips"
    case RotateXAxis = "RotateXAxis"
    case RotateYAxis = "RotateYAxis"
    case RotateZAxis = "RotateZAxis"
    
}

//struct AnimationProperty {
//    let name: PropertyKeys
//    let stepperMin: Double
//    let stepperMax: Double
//    let stepperIncrement: Double
//    let startingStepperVal: Double
//}

class SettingsViewController: UIViewController, UITextFieldDelegate {
  
    
    var stepperMin = 0 {
        didSet{
            stepperMin += 1
        }
    }
    
    
    var stepperMax = 1.0 {
        didSet{
            stepperMax += 1
        }
    }
    
    
    var stepperIncrement = 0.1{
        didSet{
            stepperIncrement += 1
        }
    }
    
    
    var startingStepperVal = 0.0{
        didSet{
            startingStepperVal = 0
        }
    }
    
    //var delegate: TextFieldToPickerViewDelegate?
    var newAnimation: String = ""
    
    let textView = TextFieldView()
    let animationView = AnimationView()
    let settingsView = SettingsView()
    let customCellView = AnimationSettingsTableViewCell()
    
    //TO DO: Add more properties
    var properties =
        
        //            [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)]
        [
            PropertyKeys.widthMultiplier.rawValue,
            PropertyKeys.heightMultiplier.rawValue,
            PropertyKeys.horizontalMultiplier.rawValue,
            PropertyKeys.verticalOffSet.rawValue,
            PropertyKeys.numberOfFlips.rawValue,
            PropertyKeys.RotateXAxis.rawValue,
            PropertyKeys.RotateYAxis.rawValue,
            PropertyKeys.RotateZAxis.rawValue,
            ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsView)
        view.addSubview(textView)
        //delegates
        settingsView.tableView.delegate = self
        settingsView.tableView.dataSource = self
//        animationView.pickerView.delegate = self
//        animationView.pickerView.dataSource = self
        
        //navigationItem.rightBarButtonItem = addBtn
        navigationItem.title = "Settings"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addPressed))
        //layoutTableView()
    }
    
    ////////////////////////////////////      Alert OK Pushed           //////////////////////////////////////
    
    //MARK: add button triggers an alert with more instructions
    @objc func addPressed() {
    
        
    }
//        self.delegate?.buttonPressedToPopulatePickerView()
//        let alertController = UIAlertController(title: "Add Setting",
//                                                message: "Enter name for setting", preferredStyle: UIAlertControllerStyle.alert)
//        //set-up text-field
//        alertController.addTextField { (textField : UITextField) -> Void in
//            textField.placeholder = "Name"
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
//            //dismiss view
//            self.dismiss(animated: true, completion: nil)
//            print("cancel pressed")
//        }
//        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
//            func buttonPressedToPopulatePickerView() {
//                guard let text = text else {return}
//                self.newAnimation
//            }
//            //TODO: - FileManagerHelper.manager.saveToFM
//            //TODO: - FileManagerHelper.manager.saveFromFMToSandBox
//
//        }
//        alertController.addAction(cancelAction)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true, completion: nil)
    
    
    
    
    ////////////////////////////////////      Custom Delegate!          //////////////////////////////////////
    

    
}


//////////////////////////////////////////        TABLE VIEW           ///////////////////////////////////////////


extension SettingsViewController: UITableViewDataSource {
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return properties.count
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimationCell", for: indexPath) as! AnimationSettingsTableViewCell
        
        let property = properties[indexPath.row]
        
        //let customCell = AnimationSettingsTableViewCell()
        
        //customCellView.settingsNameLabel.text = property
        cell.settingsNameLabel.text = "\(property): 0.0"
        
        return cell
    }
    
}


extension SettingsViewController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        switch section {
    //        case 0:
    //            return "Size Settings"
    //        case 1:
    //            return "Position Settings"
    //        case 2:
    //            return "3-D Settings"
    //        default:
    //            return "Other Settings"
    //        }
    //    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}











