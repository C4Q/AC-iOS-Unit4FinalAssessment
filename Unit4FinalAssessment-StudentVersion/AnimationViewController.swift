//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    let pv = ["sfad", "afaef", "aefsd", "eerf", "njsfdv", "qwefd", "qwesfdg"]
    
    var animationView = AnimationView()
    
    var settings = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(animationView)
        animationView.pickerView.dataSource = self
        animationView.pickerView.delegate = self
        
    }
}

extension AnimationViewController: UIPickerViewDelegate {
    
}

extension AnimationViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pv.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pv[row]
    }
    
    
}

extension AnimationViewController {
  
    
        
}
