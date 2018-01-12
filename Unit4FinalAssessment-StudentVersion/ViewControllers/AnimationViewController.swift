//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit


let animationView = AnimationView()
var pause = false

class AnimationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(animationView)
        defaultLayerValues()
    }
    
    func defaultLayerValues() {
        animationView.imageView.layer.borderWidth = 1.0
        animationView.imageView.layer.borderColor = UIColor.black.cgColor
        animationView.imageView.layer.contents = UIImage(named:"snowman")?.cgImage
    }
    
}

extension AnimationViewController: UIPickerViewDelegate {
    
}

extension AnimationViewController: UIPickerViewDataSource {
    
}
