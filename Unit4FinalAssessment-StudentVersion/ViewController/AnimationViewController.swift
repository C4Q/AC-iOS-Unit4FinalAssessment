//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
enum PropertyKeys: String {
    case Default = "Default"
    case BigCenterFlip = "Big Center Flip"
    case SkinnyRight2Flips = "Skinny Right 2 Flips"
    case BorderColor = "Border Color"
    case BorderWidth = "Border Width"
    case CornerRadius = "Corner Radius"
}

class AnimationViewController: UIViewController {
    //views
    //let animationImageView = AnimationImageView(frame: CGRect(x: 60, y: 60, width: 300, height: 300))
    let customView = CustomView()
     var currentAnimation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.6, blue: 0.9, alpha: 1.0)
        //view.addSubview(animationImageView)
        view.addSubview(customView)
        contrainViewToSafeArea()
       customView.pickerView.delegate = self
        customView.pickerView.dataSource = self
        customView.button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
    }
    func contrainViewToSafeArea() {
        let safeArea = view.safeAreaLayoutGuide
       customView.translatesAutoresizingMaskIntoConstraints = false
       customView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
       customView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
       customView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
       customView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
    }
        //For pickerView
      let pickerOptions = [PropertyKeys.Default.rawValue, PropertyKeys.BigCenterFlip.rawValue, PropertyKeys.SkinnyRight2Flips.rawValue, PropertyKeys.BorderColor.rawValue, PropertyKeys.BorderWidth.rawValue,PropertyKeys.CornerRadius.rawValue]
    
    @objc func buttonAction(sender: UIButton!) {
        switch currentAnimation {
        case PropertyKeys.BigCenterFlip.rawValue:
            animateBigCenterFlip()
        case PropertyKeys.BorderColor.rawValue:
            animateBorderColor()
        case PropertyKeys.BorderWidth.rawValue:
            animateBorderWidth()
        case PropertyKeys.CornerRadius.rawValue:
            animateCornerRadius()
        default:
            break
        }
        
        if customView.snowmanImage.layer.speed == 1 {
            let pausedTime = customView.snowmanImage.layer.convertTime(CACurrentMediaTime(), from: nil)
            customView.snowmanImage.layer.speed = 0
            customView.snowmanImage.layer.timeOffset = pausedTime
        }
            // resume
        else {
            let pausedTime = customView.snowmanImage.layer.timeOffset
           customView.snowmanImage.layer.speed = 1
            customView.snowmanImage.layer.timeOffset = 0
           customView.snowmanImage.layer.beginTime = 0
            let timeSincePause = customView.snowmanImage.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
          customView.snowmanImage.layer.beginTime = timeSincePause
        }
    }
}

extension AnimationViewController {
    func animateBigCenterFlip() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
                let angleRadian = CGFloat(2.0 * .pi) // 360
                animation.fromValue = 0 // degrees
                animation.byValue = angleRadian
                animation.duration = 5.0 // seconds
                animation.repeatCount = 1
                customView.snowmanImage.layer.add(animation, forKey: nil)
    }
    func animateBorderColor() {
        //let animation = CABasicAnimation(keyPath: "borderColor")
        let animation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = UIColor.black.cgColor
        animation.toValue = UIColor.orange.cgColor
        animation.duration = 0.5
        customView.snowmanImage.layer.add(animation, forKey: nil)
       customView.snowmanImage.layer.borderColor = UIColor.orange.cgColor
}
    func animateBorderWidth() {
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = 0
        animation.toValue = 10.0
        animation.duration = 0.5
        customView.snowmanImage.layer.add(animation, forKey: nil)
        customView.snowmanImage.layer.borderWidth = 10.0
    }
    func animateCornerRadius() {
        customView.snowmanImage.layer.masksToBounds = true
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0
        animation.toValue =  customView.snowmanImage.bounds.width/2
        animation.duration = 3.0
        customView.snowmanImage.layer.add(animation, forKey: nil)
        customView.snowmanImage.layer.cornerRadius = customView.snowmanImage.bounds.width/2
    }
   
}
    
extension AnimationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let property = pickerOptions[row]
        currentAnimation = property
    }
}
