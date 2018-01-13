//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

/*TO-DO:
 - Put animations in correct section
 */

enum PropertyName: String, Codable {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Height Multiplier"
    case horizontalPosition = "Horizontal Position"
    case verticalPosition = "Vertical Position"
    case xAxisRotation = "X Axis Rotation"
    case yAxisRotation = "Y Axis Rotation"
    //TO DO: Add other PropertyName Cases
}

struct AnimationProperty: Codable {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

class SettingsViewController: UIViewController {
    
    var animateView = AnimationView()
    
    //TO DO: Extra credit: Add two additonal properities
    var properties: [[AnimationProperty]] =
        [
            [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
             AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
             AnimationProperty(name: .horizontalPosition, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
             AnimationProperty(name: .verticalPosition, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
             AnimationProperty(name: .xAxisRotation, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
             AnimationProperty(name: .yAxisRotation, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        setUpSaveButton()
        layoutTableView()
    }
    
    func setUpSaveButton() {
        let rightButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveSettings))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    

    @objc func saveSettings() {
        let alertController =  UIAlertController(title: "Save Setting", message: "Enter New Setting Name", preferredStyle: .alert)
        alertController.addTextField { (UITextField) in
            UITextField.placeholder = "Enter Setting Name"
        }
        
        let saveSet = UIAlertAction(title: "Save", style: .default){ (_) in
        if let settingName = alertController.textFields?[0].text {
            FileManagerHelper.manager.saveUserAnimationSettings(with: settingName, and: self.properties[0])
            FileManagerHelper.manager.addNewSetting(setting: self.properties[0])
            FileManagerHelper.manager.addSettingName(name: settingName)
            print("New Setting Saved: \(self.properties)")
        
        }
        }
        let cancelSave = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(saveSet)
        alertController.addAction(cancelSave)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
 
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        return tv
    }()
    

    
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        let property = properties[indexPath.section][indexPath.row]
        cell.configureCell(property: property)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Position Settings"
        case 2:
            return "Rotation Settings"
        default:
            return "Other Settings"
        }
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if let headerText = view as? UITableViewHeaderFooterView {
//            headerText.textLabel?.textColor = UIColor.init(red: 34/255, green: 0/255, blue: 255/255, alpha: 1.0)
//        }
//    }
}

//extension SettingsViewController {
//    
//    
//    public func widthAnimaton(using imageView: UIImageView) {
//        let animation = CABasicAnimation(keyPath: "transform.scale.x")
//        animation.fromValue = 0
//        animation.byValue = properties[0][0].stepperIncrement
////        animation.toValue = properties[0][0].stepperMax
//        animation.duration = 2.0
//        imageView.layer.add(animation, forKey: nil)
//        
//    }
//    
//    public func heightAnimation(using imageView: UIImageView) {
//        let animation = CABasicAnimation(keyPath: "transform.scale.y")
//        animation.fromValue = 0
//        animation.byValue = properties[0][1].stepperIncrement
////        animation.toValue = stepper.maximumValue
//        animation.duration = 2.0
//        imageView.layer.add(animation, forKey: nil)
//        
//    }
//    
//   public  func horizontalAnimation(using imageView: UIImageView) {
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.fromValue = imageView.layer.position
////        animation.toValue = CGPoint(x: (imageView.layer.position.x + CGFloat(stepper.stepValue)) , y: imageView.layer.position.y)
//        animation.byValue = CGPoint(x: (imageView.layer.position.x + CGFloat(properties[0][2].stepperIncrement)) , y: imageView.layer.position.y)
//        animation.duration = 2.0
//        imageView.layer.add(animation, forKey: nil)
//        
//    }
//    
//    public func verticalAnimation(using imageView: UIImageView, change stepper: UIStepper) {
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.fromValue = imageView.layer.position
//        animation.byValue = CGPoint(x: imageView.layer.position.x, y: (imageView.layer.position.y + CGFloat(properties[0][3].stepperIncrement)))
//        animation.duration = 2.0
//        imageView.layer.add(animation, forKey: nil)
//        
//    }
//    
//    public func xRotationAnimation(using imageView: UIImageView) {
//        let  animation = CABasicAnimation(keyPath: "transform.rotation.x")
//        animation.fromValue = 0
//        animation.byValue = properties[0][4].stepperIncrement
//        animation.duration = 3.0
//        imageView.layer.add(animation, forKey: nil)
//    }
//    
//   public func yRotationAnimation(using imageView: UIImageView) {
//        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
//        animation.fromValue = 0
//        animation.byValue = properties[0][5].stepperIncrement
//        animation.duration = 3.0
//        imageView.layer.add(animation, forKey: nil)
//    }
//    
//    
//    
//}
//
//
//







