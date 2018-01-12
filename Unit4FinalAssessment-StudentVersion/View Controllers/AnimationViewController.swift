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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(animationView)
        animationView.savedSettingsPickerView.dataSource = self
        animationView.savedSettingsPickerView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationView.savedSettingsPickerView.reloadAllComponents()
    }
    
}

extension AnimationViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return FileManagerHelper.shared.getSavedAnimations().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return FileManagerHelper.shared.getSavedAnimations()[row].animationName
    }
    
    
}

extension AnimationViewController: UIPickerViewDelegate {
    
}
