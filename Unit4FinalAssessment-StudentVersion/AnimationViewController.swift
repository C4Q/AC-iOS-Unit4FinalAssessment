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
    var options = [SavedSettings]()
    var currentOption = 0
    let defaultOption = SavedSettings.init(name: "Default", widthMultiplier: 0, heightMultiplier: 0, horizontalOffset: 0, verticalOffset: 0, xAxisFlip: 0, yAxisFlip: 0, zAxisFlip: 2)
    

    
    override func viewDidLoad() {
        self.view.addSubview(animationView)
        options.append(defaultOption)
        animationView.animationButton.addTarget(self, action: #selector(animate), for: .touchUpInside)
        animationView.pickerView.delegate = self
        animationView.pickerView.dataSource = self
        loadData()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let arr = PersistentStoreManager.manager.getFavorites()
        if options.last?.name != arr.last?.name{
            options.append(arr.last!)
            animationView.pickerView.reloadAllComponents()
        }
    }
    
    
    func loadData(){
        let arr = PersistentStoreManager.manager.getFavorites()
        for page in arr{
            options.append(page)
        }
        
    }
    
    
    @objc func animate(){
        let selectedOption = options[currentOption]
        scale(w: selectedOption.widthMultiplier, h: selectedOption.heightMultiplier)
        offset(h: selectedOption.horizontalOffset, v: selectedOption.verticalOffset)
        
        if selectedOption.xAxisFlip != 0{
        xSpin(numberOfSpins: selectedOption.xAxisFlip)
        }
        if selectedOption.yAxisFlip != 0{
        ySpin(numberOfSpins: selectedOption.yAxisFlip)
        }
        if selectedOption.zAxisFlip != 0{
        zSpin(numberOfSpins: selectedOption.zAxisFlip)
        }
        
        
    }
    
    
    
    func scale(w: Double, h: Double){
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = CATransform3DMakeScale(CGFloat(w), CGFloat(h), 0)
        animation.duration = 1
        animationView.snowmanImage.layer.add(animation, forKey: nil)
        
    }
    
    func offset(h: Double, v: Double){
        let toValue = CATransform3DMakeTranslation(CGFloat(h), CGFloat(v), 0)
        let animation = CABasicAnimation(keyPath: "transform")
        animation.toValue = toValue
        animation.duration = 1
        animationView.snowmanImage.layer.add(animation, forKey: nil)
        
        
    }
    
    func xSpin(numberOfSpins: Double){
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = 2.0 * .pi
        
        animation.fromValue = 0
        animation.byValue = angleRadian
        animation.duration = 1
        animation.repeatCount = Float(numberOfSpins)
        animationView.snowmanImage.layer.add(animation, forKey: nil)
        
        
        
    }
    
    func ySpin(numberOfSpins: Double){
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        let angleRadian = 2.0 * .pi
        
        animation.fromValue = 0
        animation.byValue = angleRadian
        animation.duration = 1
        animation.repeatCount = Float(numberOfSpins)
        animationView.snowmanImage.layer.add(animation, forKey: nil)
        
        
        
    }
    
    func zSpin(numberOfSpins: Double){
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        let angleRadian = 2.0 * .pi
        
        animation.fromValue = 0
        animation.byValue = angleRadian
        animation.duration = 1
        animation.repeatCount = Float(numberOfSpins)
        animationView.snowmanImage.layer.add(animation, forKey: nil)
        
        
        
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


extension AnimationViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentOption = row
    }
}


extension AnimationViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectedOption = options[row]
        return selectedOption.name
    }
    
    
}
