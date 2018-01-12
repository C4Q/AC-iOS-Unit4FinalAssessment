//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var aniView = AnimationView()
    var settings = [Setting]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(aniView)
        aniView.translatesAutoresizingMaskIntoConstraints = false
        [aniView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         aniView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         aniView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         aniView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach{$0.isActive = true}
        aniView.pickerView.dataSource = self
        aniView.pickerView.delegate = self
        aniView.playButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        aniView.pickerView.reloadComponent(0)
        if StorageModel.manager.getSettings().count > 0 {
            prepareAnimation(forRow: aniView.pickerView.selectedRow(inComponent: 0))
        }
    }
    
    @objc func buttonPressed() {
        if aniView.playButton.image(for: .normal) == #imageLiteral(resourceName: "play") {
            // animate
            if let keys = aniView.imageView.layer.animationKeys() {
                resume(layer: aniView.imageView.layer)
            } else {
                prepareAnimation(forRow: aniView.pickerView.selectedRow(inComponent: 0))
                resume(layer: aniView.imageView.layer)
            }
            // change button image
            aniView.playButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        } else {
            // pause animation
            pause(layer: aniView.imageView.layer)
            //change button image
            aniView.playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
    }
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
    
}

extension AnimationViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return StorageModel.manager.getSettings().count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return StorageModel.manager.getSettings()[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        prepareAnimation(forRow: row)
    }
    
    func prepareAnimation(forRow row: Int) {
        aniView.playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        
        
        let durationForAll = 3.0
        let setting = StorageModel.manager.getSettings()[row]
        pause(layer: aniView.imageView.layer)
        let scaleX = CABasicAnimation(keyPath: "transform.scale.x")
        scaleX.toValue = setting.sizeSettings.width
        
        
        let scaleY = CABasicAnimation(keyPath: "transform.scale.y")
        scaleY.toValue = setting.sizeSettings.height
        
        
        
        let xOffset = CABasicAnimation(keyPath: "transform.translation.x")
        xOffset.toValue = setting.positionSettings.horizontalOffset
        
        let yOffset = CABasicAnimation(keyPath: "transform.translation.y")
        yOffset.toValue = setting.positionSettings.verticalOffset
        
        let xFlips = CABasicAnimation(keyPath: "transform.rotation.x")
        xFlips.toValue = CGFloat(Double(setting.otherSettings.numberOfXFlips) * .pi)
        
        let yFlips = CABasicAnimation(keyPath: "transform.rotation.y")
        yFlips.toValue = CGFloat(Double(setting.otherSettings.numberOfYFlips) * .pi)
        
        let zFlips = CABasicAnimation(keyPath: "transform.rotation.z")
        zFlips.toValue = CGFloat(Double(setting.otherSettings.numberOfZFlips) * .pi)
        
        let animations = [scaleX, scaleY, xOffset,yOffset, xFlips, yFlips, zFlips]
        animations.forEach{$0.duration = durationForAll}
        
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = animations
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.duration = 3.0
        
        groupAnimation.delegate = self
        
        aniView.imageView.layer.add(groupAnimation, forKey: nil)
        
    }
}

extension AnimationViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        aniView.imageView.layer.removeAllAnimations()
        aniView.playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
//        prepareAnimation(forRow: aniView.pickerView.selectedRow(inComponent: 0))
    }
}
