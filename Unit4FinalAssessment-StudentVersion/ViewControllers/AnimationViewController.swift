//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    //MARK: - Contants & Variables
    let animationView = AnimationView()
    let animationDuration = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AnimationBrain.manager.loadAnimationsFromDisk()
        addSubview()
        commonInit()
        animationView.pickerView.dataSource = self
        animationView.pickerView.delegate = self
    }
    
    func addSubview() {
        self.view.addSubview(animationView)
    }
    
    private func commonInit() {
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AnimationBrain.manager.loadAnimationsFromDisk()
        animationView.pickerView.reloadAllComponents()
    }
}

extension AnimationViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AnimationBrain.manager.getAnimations().count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AnimationBrain.manager.getAnimations()[row].title
    }
}

extension AnimationViewController: UIPickerViewDelegate {
}

