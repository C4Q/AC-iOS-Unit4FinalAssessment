//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit


class AnimationViewController: UIViewController {
    
    var paused = false
   let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.pickerView.delegate = self
        animationView.pickerView.dataSource = self
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(animationView)
         defaultLayerValues()
        animationView.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(sender: UIButton)
    {
        if paused {
            animationView.button.setImage(#imageLiteral(resourceName: "icons8-pause-100"), for: UIControlState.normal)
            paused = !paused
            pause(layer: animationView.imageView.layer)
            
        } else {
            animationView.button.setImage(#imageLiteral(resourceName: "icons8-play-50"), for: UIControlState.normal)
            paused = !paused
            resume(layer: animationView.imageView.layer)
        }
    }
    
//    @objc func playButtonPressed() {
//            if animationView.button.isSelected {
//                    let animation = CABasicAnimation(keyPath: "contents")
//                    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
//                    animation.fromValue = UIImage(named:"icons8-play-50")?.cgImage
//                    animation.toValue = UIImage(named:"icons8-pause-100")?.cgImage
//                    animation.duration = 2.0
//                    animationView.button.layer.add(animation, forKey: nil)
//                    animationView.button.layer.contents = UIImage(named: "icons8-pause-100")?.cgImage
////            pause(layer: animationView.imageView.layer)
//
//            } else {
//                animationView.button.isSelected = false
////                resume(layer: animationView.imageView.layer)
//            }
//    }
    
    
    func pause(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    func resume(layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    
    func defaultLayerValues() {
        animationView.imageView.layer.borderWidth = 1.0
        animationView.imageView.layer.borderColor = UIColor.black.cgColor
        animationView.imageView.layer.contents = UIImage(named:"snowman")?.cgImage
    }
    
}

extension AnimationViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //TO DO: Add to User Defaults
        print("selected row \(row)")
    }
    
}

extension AnimationViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
    
}
