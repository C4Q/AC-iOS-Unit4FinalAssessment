//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class LayerPropertyViewController: UIViewController {
   
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var button: UIButton!
    
    var buttonState = true
    var pickerViewList = ["Default", "Big Center Flip", "Skinny Right 2 Flips"]
    var arrayOfStepperValues: [Double]!
    var settingName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    //Thread 1: Fatal error: init(coder:) is not supported
//    init(arrayOfStepperValues: [Double], settingName: String) {
//        super.init(nibName: nil, bundle: nil)
//        self.arrayOfStepperValues = arrayOfStepperValues
//        self.settingName = settingName
//    }
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        fatalError("init(coder:) is not supported")
//    }
    

    static func storyBoardInstance() -> LayerPropertyViewController {
        //static don't need to instantiate class to get access to it
        //here we are getting the storyboard that contains the layerPropertyViewController
        let storyBoard = UIStoryboard(name: "LayerProperty", bundle: nil)
        //bundle nil bc we are inside the app we need
        
        //get and instantiate LayerPropertyViewController
        let layerPropertyVC = storyBoard.instantiateViewController(withIdentifier: "LayerPropertyViewController") as! LayerPropertyViewController
        return layerPropertyVC
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
    //didn't realize the pickerview selection was supposed to be created from the settings till after i did some animations from the gif
    @IBAction func buttonPressed(_ sender: UIButton) {
        // pause
        if buttonState == true {
            let pausedTime = imageView.layer.convertTime(CACurrentMediaTime(), from: nil)
            imageView.layer.speed = 0
            imageView.layer.timeOffset = pausedTime
            buttonState = false
            button.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
        }
            // resume
        else {
            let pausedTime = imageView.layer.timeOffset
            imageView.layer.speed = 1
            imageView.layer.timeOffset = 0
            imageView.layer.beginTime = 0
            let timeSincePause = imageView.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            imageView.layer.beginTime = timeSincePause
            buttonState = true
            button.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
        }
    }
    
    
}

extension LayerPropertyViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerViewList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row == 1) {
            buttonPressed(button)
            bigCenterFlip()
        } else if (row == 2){
            buttonPressed(button)
            skinnyRight2Flips()
        }
        
        else{
            print("animation not coded yet")
        }
    }
}

//Mark: - Animation Functions - using core animation
extension LayerPropertyViewController {
    
    func bigCenterFlip() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat(2.0 * .pi)// 360
        animation.fromValue = 0 //degrees
        animation.byValue = angleRadian
        animation.duration = 2.0 //
        animation.repeatCount = Float.infinity
        imageView.layer.add(animation, forKey: nil)
    }
    
    func skinnyRight2Flips() {
//        let toTopLeft = CATransform3DMakeTranslation(-view.layer.position.x, -view.layer.position.y, 0)     // top left
        let flips = CATransform3DMakeRotation(360, 1, 0, 0)

        let toTopRight = CATransform3DMakeTranslation(view.layer.position.x, -view.layer.position.y,0)     // top right
        
        let toBottomLeft = CATransform3DMakeTranslation(-view.layer.position.x, view.layer.position.y, 0)   // bottom left
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        keyframeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        keyframeAnimation.values = [CATransform3DIdentity,
                                    toTopRight,CATransform3DIdentity,flips]
        keyframeAnimation.duration = 4.0
        keyframeAnimation.repeatCount = Float.infinity
        imageView.layer.add(keyframeAnimation, forKey: nil)
    }
    
    
    
}
