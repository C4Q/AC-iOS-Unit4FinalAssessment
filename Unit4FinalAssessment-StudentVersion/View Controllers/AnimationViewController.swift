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
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        
        
    }
    
    //buttonAction
    
    
    
    
    ////////////////////////////////////      Picker VIEW           //////////////////////////////////////
    
    //MARK: - PICKER VIEW
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return properties.count
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return properties.row
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        let property = properties[row]
    //        newAnimation = property
    //    }
    //
    //
    //    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        //buttonPressedToPopulatePickerView()
    //        return
    //
    //    }
    
    
}
