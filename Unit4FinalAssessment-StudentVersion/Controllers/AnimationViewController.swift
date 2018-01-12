//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, MySettingsDelegate {//conformed to my protocol

    //Snowman Image setup
    lazy var snowmanImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "snowman")
        return image
    }()
    
    //Picker setup
    lazy var settingsPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        //TODO: set up picker view programatically
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.showsSelectionIndicator = true
        pickerView.backgroundColor = UIColor.white
        pickerView.selectRow(0, inComponent: 0, animated: true)
        return pickerView
    }()
    
    //Pause/play Button setup
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        button.addTarget(self, action:  #selector(changeButtonImage), for: .touchUpInside)
        return button
    }()
    
    @objc func changeButtonImage() {
        if myButton.imageView?.image == #imageLiteral(resourceName: "pause") {
            myButton.imageView?.image = #imageLiteral(resourceName: "play")
        } else {
            myButton.imageView?.image = #imageLiteral(resourceName: "play")
        }
    }
    
    var pickerValues = ["Default", "Setting One", "Setting Two", "Setting Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        self.view.addSubview(snowmanImage)
        self.view.addSubview(myButton)
        self.view.addSubview(settingsPickerView)
        setConstraints()
    }
    
    //setting my constraints
    func setConstraints() {
        //for image
        snowmanImage.translatesAutoresizingMaskIntoConstraints = false
        snowmanImage.widthAnchor.constraint(equalToConstant: 275).isActive = true //180
        snowmanImage.heightAnchor.constraint(equalToConstant: 275).isActive = true //180
        snowmanImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        snowmanImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true //28

        //for pickerview
        settingsPickerView.translatesAutoresizingMaskIntoConstraints = false
        settingsPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsPickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true//150


        //for pause/play button
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.widthAnchor.constraint(equalToConstant: 40).isActive = true //180
        myButton.heightAnchor.constraint(equalToConstant: 40).isActive = true //180
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        myButton.topAnchor.constraint(equalTo: settingsPickerView.bottomAnchor, constant: 10).isActive = true
        //myButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func newSettingAdded() {
        //pickerValues.append("added a setting")
    }
}

extension AnimationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row:\(row)")
        print("value:\(pickerValues[row])")
    }
    
}


/* My notes:
Could also use ->> snowmanImage.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
 */

