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
    var animations = [DataPersistenceHelper.UserAnimation]() {
        didSet {
            animationView.pickerView.reloadAllComponents()
            animationView.pickerView.selectRow(0, inComponent: 0, animated: false)
        }
    }
    
    var loadedAnimation: DataPersistenceHelper.UserAnimation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        
        view.addSubview(animationView)
        
        animationView.pickerView.dataSource = self
        animationView.pickerView.delegate = self
        
        animationView.controlButton.addTarget(self, action: #selector(controlButtonTapped), for: .touchUpInside)
        
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animations = DataPersistenceHelper.manager.getFavoriteAnimations()

    }
    
    @objc func controlButtonTapped() {
        
        guard let loadedAnimation = loadedAnimation else { return }
        
        Animation.doAnimation(animation: loadedAnimation.animation, on: animationView.animationImageView)
        
    }
    
    
    
    
    
    
}

extension AnimationViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animations[row].name
        
    }
}

extension AnimationViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadedAnimation = animations[row]
    }

}

