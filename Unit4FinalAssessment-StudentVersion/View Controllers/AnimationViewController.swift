//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    let animationView = AnimationView()
    
    var settings = [[AnimationProperty]]() {
        didSet {
            animationView.savedSettingsPicker.reloadAllComponents()
            print("Settings did set: \(settings)")
        }
    }
    
    var settingName = [String]()
        

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(animationView)
        animationView.savedSettingsPicker.dataSource = self
        animationView.savedSettingsPicker.delegate = self
        self.settings = FileManagerHelper.manager.getAllAnimations()
        self.settingName = FileManagerHelper.manager.getAllAnimationNames()
    }
}


extension AnimationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return settingName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let settingTitle = settings[component][row].name.rawValue
//        switch settingTitle {
//        case PropertyName.heightMultiplier.rawValue:
//            heightAnimation()
//        case PropertyName.widthMultiplier.rawValue:
//            widthAnimaton()
//        case PropertyName.horizontalPosition.rawValue:
//            horizontalAnimation()
//        case PropertyName.verticalPosition.rawValue:
//            verticalAnimation()
//        case PropertyName.xAxisRotation.rawValue:
//            xRotationAnimation()
//        case PropertyName.yAxisRotation.rawValue:
//            yRotationAnimation()
//        default:
//            break
//        }
        
    }
    
    
}



extension AnimationViewController {
    
    
    func widthAnimaton() {
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        animation.fromValue = 0
        animation.byValue = settings[0][0].stepperIncrement
        //        animation.toValue = properties[0][0].stepperMax
        animation.duration = 2.0
        animationView.snowmanImageView.layer.add(animation, forKey: nil)
        
    }
    
  func heightAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale.y")
        animation.fromValue = 0
        animation.byValue = settings[0][1].stepperIncrement
        //        animation.toValue = stepper.maximumValue
        animation.duration = 2.0
        animationView.snowmanImageView.layer.add(animation, forKey: nil)
        
    }
    
     func horizontalAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = animationView.snowmanImageView.layer.position
        //        animation.toValue = CGPoint(x: (imageView.layer.position.x + CGFloat(stepper.stepValue)) , y: imageView.layer.position.y)
        animation.byValue = CGPoint(x: (animationView.snowmanImageView.layer.position.x + CGFloat(settings[0][2].stepperIncrement)) , y: animationView.snowmanImageView.layer.position.y)
        animation.duration = 2.0
        animationView.snowmanImageView.layer.add(animation, forKey: nil)
        
    }
    
     func verticalAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = animationView.snowmanImageView.layer.position
        animation.byValue = CGPoint(x: animationView.snowmanImageView.layer.position.x, y: (animationView.snowmanImageView.layer.position.y + CGFloat(settings[0][3].stepperIncrement)))
        animation.duration = 2.0
        animationView.snowmanImageView.layer.add(animation, forKey: nil)
        
    }
    
    func xRotationAnimation() {
        let  animation = CABasicAnimation(keyPath: "transform.rotation.x")
        animation.fromValue = 0
        animation.byValue = settings[0][4].stepperIncrement
        animation.duration = 3.0
        animationView.snowmanImageView.layer.add(animation, forKey: nil)
    }
    
     func yRotationAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.fromValue = 0
        animation.byValue = settings[0][5].stepperIncrement
        animation.duration = 3.0
        animationView.snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    
    
}




