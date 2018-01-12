//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .orange
        iv.image = #imageLiteral(resourceName: "snowman")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .cyan
        return pv
    }()
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        return button
    }()
    
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        setupImageView()
        setupPickerView()
        setupPlayButton()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [imageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
         imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)].forEach{$0.isActive = true}
    }
    
    private func setupPickerView() {
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        [pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
         pickerView.centerYAnchor.constraint(equalTo: topAnchor, constant: bounds.height * 0.7)].forEach{$0.isActive = true}
    }
    
    private func setupPlayButton() {
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        [playButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor),
         playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
         playButton.widthAnchor.constraint(equalToConstant: 50),
         playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor)].forEach{$0.isActive = true}
    }
    
}
