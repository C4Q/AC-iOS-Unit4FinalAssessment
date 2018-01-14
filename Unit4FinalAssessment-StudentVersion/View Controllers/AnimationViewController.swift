//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var properties = [[AnimationProperty]]() {
        didSet {
            self.pickerView.reloadAllComponents()
        }
    }
    
    var property = [AnimationProperty]() {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populatePickerView()
    }
    
    private func populatePickerView() {
        properties = FileManagerHelper.manager.getAllAnimations()
    }
    
    var pressed = false
    var highPosition = NSLayoutConstraint()
    var widthPosition = NSLayoutConstraint()
    var centerX = NSLayoutConstraint()
    var centerY = NSLayoutConstraint()
    var propertyAnimator = UIViewPropertyAnimator(duration: 5.0, curve: UIViewAnimationCurve.easeInOut, animations: nil)
    var animation: CABasicAnimation!
    
    lazy var animatedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "snowman")
        return imageView
    }()
    
    lazy var pickerView: UIPickerView = {
        let pickView = UIPickerView()
        pickView.delegate = self
        pickView.dataSource = self
        return pickView
    }()
    
    lazy var startStopButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var imageContainerStackView: UIStackView = {
        let stView = UIStackView()
        stView.axis  = UILayoutConstraintAxis.vertical
        stView.distribution  = UIStackViewDistribution.fillEqually
        stView.alignment = UIStackViewAlignment.center
        stView.spacing   = 8.0
        return stView
    }()
    
    private func setupViews() {
        addMainView()
        displayOnScreen()
        constraints()
    }
    
    private func addMainView() {
        view.addSubview(animatedImageView)
        view.addSubview(pickerView)
        view.addSubview(startStopButton)
    }
    
    private func displayOnScreen() {
        animatedImageView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constraints() {
        centerY = animatedImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        centerY.isActive = true
        widthPosition = animatedImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        widthPosition.isActive = true
        centerX = animatedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerX.isActive = true
        highPosition = animatedImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45)
        highPosition.isActive = true
        pickerView.bottomAnchor.constraint(equalTo: startStopButton.topAnchor, constant: -16).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        pickerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33).isActive = true
        startStopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        startStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension AnimationViewController {
    @objc func buttonAction(sender: UIButton)
    {
        
        if pressed {
            self.startStopButton.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
            propertyAnimator.pauseAnimation()
            pressed = !pressed
        } else {
            let indexPath = pickerView.selectedRow(inComponent: 0)
            self.property = properties[indexPath]
            self.startStopButton.setImage(#imageLiteral(resourceName: "Stop"), for: UIControlState.normal)
            self.animatedImageView.layer.removeAllAnimations()
            applyingAnimations()
            pressed = !pressed
        }
    }
}

extension AnimationViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return properties[row][0].animation
    }
}

extension AnimationViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return properties.count
    }
}
