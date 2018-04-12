//
//  AnimationsView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Richard Crichlow on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupAndConstrainObjects()
    }

    // playButton
    lazy var playButton: UIButton = {
        let butt = UIButton()
        butt.setImage(UIImage(named:"play"), for: .normal)
        return butt
    }()
    
    // pickerview
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .white
        
        return pv
    }()
    
    // Imageview
    lazy var snowmanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "snowman")
        return imageView
    }()
    
    func setupAndConstrainObjects() {
        
        //ARRAY MUST BE ON ORDER!!
        let Objects = [playButton, pickerView, snowmanImageView] as [UIView]
        
        Objects.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            
            //playbutton
            playButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            playButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10),
            playButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.20),
            
            
            //pickerView
            pickerView.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: 0),
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            pickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            //imageview
            snowmanImageView.bottomAnchor.constraint(equalTo: pickerView.topAnchor, constant: 0),
            snowmanImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            snowmanImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1)
            
            ])
    }
    
}
