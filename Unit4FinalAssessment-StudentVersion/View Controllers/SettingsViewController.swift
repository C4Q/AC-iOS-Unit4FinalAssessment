//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Height Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset = "Vertical Offset"
    case duration = "Duration"
    case numberOfFlips = "Number of Flips"
    case opacity = "Opacity"
    case curvature = "Curvature"
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
    let referenceValue: Int
}

struct Animation: Codable {
    var widthMultiplier: Double
    var heightMultiplier: Double
    
    var horizontalOffset: Double
    var verticalOffset: Double
    
    var duration: Double
    var flips: Double
    var opacity: Double
    var curvature: Double
    
    static func doAnimation(animation: Animation, on image: UIImageView) {
        
        image.layer.masksToBounds = true
        
        UIView.animate(withDuration: animation.duration) {
            
            image.transform = CGAffineTransform(scaleX: CGFloat(animation.widthMultiplier), y: CGFloat(animation.heightMultiplier)).translatedBy(x: CGFloat(animation.horizontalOffset), y: CGFloat(animation.verticalOffset))
            image.layer.opacity = Float(animation.opacity)
            image.layer.cornerRadius = CGFloat(animation.curvature)
            
        }
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat.pi * CGFloat(animation.flips * 2)
        
        basicAnimation.fromValue = 0
        basicAnimation.byValue = angleRadian
        basicAnimation.duration = animation.duration
        image.layer.add(basicAnimation, forKey: nil)
        
        
    }
}

class SettingsViewController: UIViewController {
    
    
    var animationToSave = Animation(widthMultiplier: 1, heightMultiplier: 1, horizontalOffset: 0, verticalOffset: 0, duration: 1, flips: 0, opacity: 1, curvature: 0)
    
    var properties: [[AnimationProperty]] =
        [
            // Scale
            [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 1.0, referenceValue: 0),
             AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 1.0, referenceValue: 1)
            ],
            
            // Offset
            [AnimationProperty(name: .horizontalOffset, stepperMin: -300, stepperMax: 300.0, stepperIncrement: 5, startingStepperVal: 0.0, referenceValue: 2),
             AnimationProperty(name: .verticalOffset, stepperMin: -300, stepperMax: 300.0, stepperIncrement: 5, startingStepperVal: 0.0, referenceValue: 3)
            ],
            
            // Other
            [AnimationProperty(name: .duration, stepperMin: 0.0, stepperMax: 10.0, stepperIncrement: 0.5, startingStepperVal: 1.0, referenceValue: 4),
            AnimationProperty(name: .numberOfFlips, stepperMin: 0, stepperMax: 10.0, stepperIncrement: 1, startingStepperVal: 0.0, referenceValue: 5),
             AnimationProperty(name: .opacity, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 1.0, referenceValue: 6),
             AnimationProperty(name: .curvature, stepperMin: 0, stepperMax: 20.0, stepperIncrement: 1, startingStepperVal: 0.0, referenceValue: 7)
            ]
    ]
    


    
    @objc func addFavoriteAnimationButtonTapped() {
        
        let alert = UIAlertController(title: "Add Setting", message: "Enter a name for your setting.", preferredStyle: .alert)
        
        
        alert.addTextField(configurationHandler: {
            $0.placeholder = "Enter a name."
        })
 
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned self] _ in
            guard let name = alert.textFields?[0].text else { return }
            DataPersistenceHelper.manager.addAnimation(name: name, animation: self.animationToSave)
        }
        alert.addAction(submitAction)
        
        
        present(alert, animated: true, completion: nil)
        
        //self.animationToSave = Animation(widthMultiplier: 1, heightMultiplier: 1, horizontalOffset: 0, verticalOffset: 0, duration: 1, flips: 0, opacity: 1, curvature: 0)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFavoriteAnimationButtonTapped))
        
        navigationItem.rightBarButtonItem = addButton
        
        layoutTableView()
    }
    
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        
        tv.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        
        
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        
        
        let property = properties[indexPath.section][indexPath.row]
        
        cell.propertyLabel.text = "\(property.name.rawValue): "
        
        cell.stepper.tag = property.referenceValue
            
        cell.stepper.value = property.startingStepperVal
        cell.stepper.stepValue = property.stepperIncrement
        cell.stepper.minimumValue = property.stepperMin
        cell.stepper.maximumValue = property.stepperMax
        
        cell.stepper.addTarget(self, action: #selector(stepperPressed), for: .valueChanged)
        
        cell.valueLabel.text = cell.stepper.value.description
        
//        switch property.name {
//        case .widthMultiplier:
//            animationToSave.widthMultiplier = cell.stepper.value
//        case .heightMultiplier:
//            animationToSave.heightMultiplier = cell.stepper.value
//        case .horizontalOffset:
//            animationToSave.horizontalOffset = cell.stepper.value
//        case .verticalOffset:
//            animationToSave.verticalOffset = cell.stepper.value
//        case .duration:
//            animationToSave.duration = cell.stepper.value
//        case .numberOfFlips:
//            animationToSave.flips = cell.stepper.value
//        case .opacity:
//            animationToSave.opacity = cell.stepper.value
//        case .curvature:
//            animationToSave.curvature = cell.stepper.value
//
//        }
        
        return cell
    }
    
    @objc func stepperPressed(_ stepper: UIStepper) {
        
        switch stepper.tag {
        case 0:
            animationToSave.widthMultiplier = stepper.value
        case 1:
            animationToSave.heightMultiplier = stepper.value
        case 2:
            animationToSave.horizontalOffset = stepper.value
        case 3:
            animationToSave.verticalOffset = stepper.value
        case 4:
            animationToSave.duration = stepper.value
        case 5:
            animationToSave.flips = stepper.value
        case 6:
            animationToSave.opacity = stepper.value
        case 7:
            animationToSave.curvature = stepper.value
        default:
            break
        }
        
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Offset Settings"
        default:
            return "Other Settings"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}











