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
        stackViewOfButtons.axis = .horizontal
        setupCircles()
    }
    
    func setupCircles() {
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
        
        NSLayoutConstraint.activate([
            firstCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            firstCircle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            secondCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            secondCircle.leadingAnchor.constraint(equalTo: firstCircle.trailingAnchor, constant: 10),
       
            thirdCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            thirdCircle.leadingAnchor.constraint(equalTo: secondCircle.trailingAnchor, constant: 10),
            
            fourthCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            fourthCircle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            
        ])
    }


}

