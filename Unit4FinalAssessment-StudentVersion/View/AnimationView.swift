//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Clint Mejia on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    //MARK: - Constant
    let animationDuration = 5.0
    
    //MARK: - Outlets
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(named: "snowman")
        return imageView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "pause"), for: .selected)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    
    // initializing
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()  //setting the background color
    }
    
    // required. Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //MARK: - Functions
    private func commonInit() {
        backgroundColor = .white
        addSubview()
        setupViews()
    }
    
    private func addSubview() {
        addSubview(imageView)
        addSubview(pickerView)
        addSubview(button)
    }
    private func setupViews() {
        setupImageView()
        setupPickerView()
        setupButton()
    }
    
    @objc func buttonPressed() {
        guard button.isSelected == true else {
            button.isSelected = true
            play(layer: imageView.layer)
            animate()
            return
        }
        button.isSelected = false
        pause(layer: imageView.layer)
        return
    }
    
    func pause(layer: CALayer) {
        let pause = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pause
    }
    
    func play(layer: CALayer) {
        let pause = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pause
        layer.beginTime = timeSincePause
    }
    
    func animate() {
        let index = pickerView.selectedRow(inComponent: 0)
        let settings = FileManagerHelper.manager.getAnimations()[index].settings
        animateRotationX(with: settings.xRotations)
        animateRotationY(with: settings.yRotations)
        animateRotationZ(with: settings.zRotations)
        heightAnimation(with: settings.height)
        widthAnimation(with: settings.width)
        verticalOffsetAnimation(with: settings.verticalPosition)
        horizontalOffsetAnimation(with: settings.horizontalPosition)
        
    }
    
    func animateRotationX(with value: Float) {
        if value == 0 { return }
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat(2.0 * .pi)
        animation.fromValue = 0
        animation.byValue = angleRadian
        animation.duration = animationDuration
        animation.repeatCount = value
        imageView.layer.add(animation, forKey: nil)
    }
    
    func animateRotationY(with value: Float) {
        if value == 0 { return }
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        let angleRadian = CGFloat(2.0 * .pi)
        animation.fromValue = 0
        animation.byValue = angleRadian
        animation.duration = animationDuration
        animation.repeatCount = value
        imageView.layer.add(animation, forKey: nil)
    }
    
    func animateRotationZ(with value: Float) {
        if value == 0 { return }
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        let angleRadian = CGFloat(2.0 * .pi)
        animation.fromValue = 0
        animation.byValue = angleRadian
        animation.duration = animationDuration
        animation.repeatCount = value
        imageView.layer.add(animation, forKey: nil)
    }
    
    func heightAnimation(with value: Double) {
        if value == 0 { return }
        let animation = CABasicAnimation(keyPath: "transform.scale.y")
        let toValue = CATransform3DMakeScale(0, CGFloat(value), 0)
        let fromValue = CATransform3DMakeScale(1, 1, 0)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = animationDuration
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        imageView.layer.add(animation, forKey: nil)
    }

    func widthAnimation(with value: Double) {
        if value == 0 { return }
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        let toValue = CATransform3DMakeScale(CGFloat(value), 0, 0)
        let fromValue = CATransform3DMakeScale(1, 1, 0)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = animationDuration
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        imageView.layer.add(animation, forKey: nil)
    }
    
    
    func verticalOffsetAnimation(with value: Double) {
        if value == 0 { return }
        let animation = CABasicAnimation(keyPath: "transform")
        let toValue = CATransform3DMakeTranslation(0, CGFloat(value), 0)
        animation.toValue = toValue
        animation.duration = animationDuration
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        imageView.layer.add(animation, forKey: nil)
    }
    
    func horizontalOffsetAnimation(with value: Double) {
        if value == 0 { return }
        let animation = CABasicAnimation(keyPath: "transform")
        let toValue = CATransform3DMakeTranslation(CGFloat(value), 0, 0)
        animation.toValue = toValue
        animation.duration = animationDuration
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        imageView.layer.add(animation, forKey: nil)
    }
    
    //MARK: - Contraints
    private func setupImageView() {
        let safeArea = safeAreaLayoutGuide
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 22).isActive = true
        imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -22).isActive = true
        imageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    func setupPickerView() {
        let safeArea = safeAreaLayoutGuide
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -12).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
        pickerView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.4 ).isActive = true
    }
    
    private func setupButton() {
        let safeArea = safeAreaLayoutGuide
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8).isActive = true
        button.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.08).isActive = true
        button.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.08).isActive = true
    }
}

extension AnimationView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        imageView.layer.removeAllAnimations()
    }
}
