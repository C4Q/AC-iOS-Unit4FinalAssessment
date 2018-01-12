//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by Masai Young on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView, CAAnimationDelegate {
    
    var buttonState = ButtonState.normal {
        didSet {
            switch self.buttonState {
            case .animating:
                performAnimations()
                playButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            case .paused:
                pause()
                playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            case .normal:
                resume()
                playButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
        self.backgroundColor = UIColor(red:0.92, green:0.69, blue:0.25, alpha:1.00)
    }
    
    func setupViews() {
        setupImageView()
        setupPickerView()
        setupPlayButton()
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "snowman")
        return iv
    }()
    
    lazy var playButton: UIButton = {
        let bttn = UIButton()
        bttn.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        bttn.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        return bttn
    }()
    
    lazy var animationPickerview: UIPickerView = {
        let apv = UIPickerView()
        apv.backgroundColor = .white
        return apv
    }()
    
    enum ButtonState {
        case normal
        case animating
        case paused
    }
    
    func pause() {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    func resume() {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    @objc func playButtonPressed() {
        switch self.buttonState {
        case .normal:
            self.buttonState = .animating
        case .animating:
            self.buttonState = .paused
        case .paused:
            self.buttonState = .normal
        }
        
    }
    
    func updateButtonState() {
        self.buttonState = .normal
        playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
    }
    
    func performAnimations() {
        let index = animationPickerview.selectedRow(inComponent: 0)
        guard !KeyedArchiverClient.shared.fetchAnimations().isEmpty else { return }
        let animation = KeyedArchiverClient.shared.fetchAnimations()[index]
        let widthMult = CGFloat(animation.widthMultiplier)
        let heightMult = CGFloat(animation.heightMultiplier)
        let xOffset = CGFloat(animation.horizontalOffset)
        let yOffset = CGFloat(animation.verticalOffset)
        let flips = animation.numberOfFlips
        
        self.changeScale(width: widthMult, height: heightMult)
        self.performFlips(flips)
        self.changePosition(x: xOffset, y: yOffset)
    }
    
    func changeScale(width: CGFloat, height: CGFloat) {
        UIView.animate(withDuration: 2.0, animations: {
            self.imageView.transform = CGAffineTransform.init(scaleX: width, y: height)
        })
    }
    
    func changePosition(x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: 2.0, animations: {
            self.imageView.center.x += x
            self.imageView.center.y += y
        })
    }
    
    func performFlips(_ numberOfFlips: Double) {
        let transformRotaion = CABasicAnimation(keyPath: "transform.rotation.x")
        transformRotaion.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transformRotaion.fromValue = 0
        transformRotaion.byValue = CGFloat(2.0 * .pi * numberOfFlips)
        transformRotaion.duration = 2.0
        transformRotaion.delegate = self
        self.imageView.layer.add(transformRotaion, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        updateButtonState()
    }
    
    
    
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
    }
    
    private func setupPickerView() {
        self.addSubview(animationPickerview)
        animationPickerview.translatesAutoresizingMaskIntoConstraints = false
        animationPickerview.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        animationPickerview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        animationPickerview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
    }
    
    private func setupPlayButton() {
        self.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: animationPickerview.bottomAnchor, constant: 10).isActive = true
        playButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    
    

}
