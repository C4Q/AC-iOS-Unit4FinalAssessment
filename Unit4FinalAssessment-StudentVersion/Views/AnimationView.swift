//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Luis Calle on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    var playingAnimation: Bool = false
    
    // snowman image view
    lazy var snowmanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "snowman")
        return imageView
    }()
    
    private func setupSnowmanImageView() {
        addSubview(snowmanImageView)
        snowmanImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            snowmanImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            snowmanImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            snowmanImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            snowmanImageView.heightAnchor.constraint(equalTo: snowmanImageView.widthAnchor)
        ])
    }
    
    // saved settings picker view
    lazy var savedSettingsPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    private func setupSavedSettingsPickerView() {
        addSubview(savedSettingsPickerView)
        savedSettingsPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            savedSettingsPickerView.topAnchor.constraint(equalTo: snowmanImageView.bottomAnchor, constant: 8),
            savedSettingsPickerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            savedSettingsPickerView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    // animation button
    lazy var animationbutton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(animationButtonPressed), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        return button
    }()
    
    private func setupAnimationbutton() {
        addSubview(animationbutton)
        animationbutton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationbutton.topAnchor.constraint(equalTo: savedSettingsPickerView.bottomAnchor, constant: 8),
            animationbutton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.1),
            animationbutton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            animationbutton.heightAnchor.constraint(equalTo: animationbutton.widthAnchor),
            animationbutton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc private func animationButtonPressed() {
        if FileManagerHelper.shared.getSavedAnimations().isEmpty {
            showAlertController(with: "Error", message: "First you need to add new animation from settings page")
            return
        }
        if playingAnimation {
            playingAnimation = false
            pause(layer: snowmanImageView.layer)
            animationbutton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        } else {
            playingAnimation = true
            resume(layer: snowmanImageView.layer)
            animationbutton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            let selectedValue = savedSettingsPickerView.selectedRow(inComponent: 0)
            let animationsArray = FileManagerHelper.shared.getSavedAnimations()[selectedValue].userAnimations
            for userAnimation in animationsArray {
                switch userAnimation.propertyName {
                case .widthMultiplier:
                    widthAnimation(value: userAnimation.value)
                case .heightMultiplier:
                    heightAnimation(value: userAnimation.value)
                case .horizontalOffset:
                    horizontalOffsetAnimation(value: userAnimation.value)
                case .verticalOffset:
                    verticalOffsetAnimation(value: userAnimation.value)
                case .numberOfXFlips:
                    xFlipsAnimation(value: userAnimation.value)
                case .numberOfYFlips:
                    yFlipsAnimation(value: userAnimation.value)
                case .numberOfZFlips:
                    zFlipsAnimation(value: userAnimation.value)
                case .borderSize:
                    borderSizeAnimation(value: userAnimation.value)
                }
            }
        }
    }
    
    private func showAlertController(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func widthAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        let toValue = CATransform3DMakeScale(CGFloat(value), 0, 0)
        animation.toValue = toValue
        animation.duration = 5.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    func heightAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "transform.scale.y")
        let toValue = CATransform3DMakeScale(CGFloat(value), 0, 0)
        animation.toValue = toValue
        animation.duration = 5.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    func horizontalOffsetAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "transform")
        let toValue = CATransform3DMakeTranslation(CGFloat(value), 0, 0)
        animation.toValue = toValue
        animation.duration = 5.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    func verticalOffsetAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "transform")
        let toValue = CATransform3DMakeTranslation(0, CGFloat(value), 0)
        animation.toValue = toValue
        animation.duration = 5.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    func xFlipsAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat.pi * 2.0
        animation.byValue = angleRadian
        animation.duration = 3
        animation.repeatCount = Float(value)
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    func yFlipsAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        let angleRadian = CGFloat.pi * 2.0
        animation.byValue = angleRadian
        animation.duration = 3
        animation.repeatCount = Float(value)
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    func zFlipsAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        let angleRadian = CGFloat.pi * 2.0
        animation.byValue = angleRadian
        animation.duration = 3
        animation.repeatCount = Float(value)
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
    func borderSizeAnimation(value: Double) {
        if value == 0.0 { return }
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = snowmanImageView.layer.borderWidth
        animation.toValue = value
        animation.duration = 5
        snowmanImageView.layer.add(animation, forKey: nil)
        snowmanImageView.layer.borderWidth = CGFloat(value)
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
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        setupViews()
    }
    
    private func setupViews() {
        setupSnowmanImageView()
        setupSavedSettingsPickerView()
        setupAnimationbutton()
    }

}
