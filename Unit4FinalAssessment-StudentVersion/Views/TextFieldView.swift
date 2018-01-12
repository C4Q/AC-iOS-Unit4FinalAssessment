//
//  TextFieldView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class TextFieldView: UIView {

    //TextField
    lazy var textField: UITextField = {
        let tField = UITextField()
        tField.backgroundColor = UIColor.darkGray
        tField.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        tField.textAlignment = .center
        tField.placeholder = "Name"
        tField.tintColor = .white
        tField.textColor = .white
        tField.keyboardType = .numbersAndPunctuation
        tField.keyboardAppearance = .dark
        tField.borderStyle =  .roundedRect
        return tField
    }()
    
    //Initialization
    override init(frame: CGRect) {//overriding the parent class's functions
        super.init(frame: UIScreen.main.bounds)
        setUpGUI()
    }
    
    required init?(coder aDecoder: NSCoder) { //now the new initializer required for this uiView
        super.init(coder: aDecoder)
        //setUpGUI()
    }
    
    private func setUpGUI() {
        //backgroundColor = .white
        setupAndConstrainObjects()
    }
    
    private func setupAndConstrainObjects() {
        
        //ARRAY MUST BE ON ORDER!!
        let favoriteObjects = [textField] as [UIView]
        
        favoriteObjects.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.50),
            textField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
            ])
    }


}
