//
//  ViewController.swift
//  testBank
//
//  Created by N S on 20.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //circles on the top to fill em in
    var firstCircle = UIButton(type: .system)
    var secondCircle = UIButton(type: .system)
    var thirdCircle = UIButton(type: .system)
    var fourthCircle = UIButton(type: .system)
    
    var stackViewOfButtons = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .brown
    
        view.addSubview(stackViewOfButtons)
        setupStack()
        
    }
    
    func setupStack() {
        let circles = [firstCircle, secondCircle, thirdCircle, fourthCircle]
        for circle in circles {
            circle.translatesAutoresizingMaskIntoConstraints = false
            circle.backgroundColor = .white
            circle.layer.cornerRadius = 15
            circle.layer.borderColor = UIColor.black.cgColor
            circle.layer.borderWidth = 5
            circle.clipsToBounds = true
            circle.isUserInteractionEnabled = false
            view.addSubview(circle)
        }
        
        stackViewOfButtons.axis = .horizontal
        stackViewOfButtons.alignment = .center
        stackViewOfButtons.distribution = .equalSpacing
        
        stackViewOfButtons.addArrangedSubview(firstCircle)
        stackViewOfButtons.addArrangedSubview(secondCircle)
        stackViewOfButtons.addArrangedSubview(thirdCircle)
        stackViewOfButtons.addArrangedSubview(fourthCircle)
        
        stackViewOfButtons.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewOfButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewOfButtons.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    

}

