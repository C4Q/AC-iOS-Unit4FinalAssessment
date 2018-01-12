//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit



class AnimationView: UIView {
    
    var isAnimating = false
    
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "snowman")
        return image
    }()
    
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        
        //dont forget to set in the view controller
//        pv.dataSource = self
//        pv.delegate = self
        return pv
    }()
    
    lazy var playPauseButton: UIButton = {
        let button = UIButton()
       // button.backgroundColor = .black
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(playPause), for: .touchUpInside)
        return button
    }()
    
    func pause(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
        playPauseButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
    }
    
    func resume(layer: CALayer) {
        
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
        playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
    }
    
    @objc func playPause() {
//        if isAnimating == true {
//            pause(layer: )
//
//        } else {
//            resume(layer: <#T##CALayer#>)
//        }
        print("pressed")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        setupViews()
    }
    
    private func setupViews() {
        setupImageView()
        setupPickerView()
        setupPlayPauseButton()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
             imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
             imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
             imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
             imageView.widthAnchor.constraint(equalTo: widthAnchor),
             imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
             ])
    }
    
    private func setupPickerView() {
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [pickerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
             pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
             pickerView.trailingAnchor.constraint(equalTo: trailingAnchor),
             pickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30),
             pickerView.widthAnchor.constraint(equalTo: widthAnchor),
             pickerView.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func setupPlayPauseButton() {
        addSubview(playPauseButton)
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [playPauseButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20),
             playPauseButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08),
             playPauseButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15),
            
             
             playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
             playPauseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)])
    }
    
}
