//
//  SecondVC.swift
//  testBank
//
//  Created by N S on 21.06.2023.
//

import UIKit

class SecondVC: UIViewController {
    var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        setupPin()
    }
    
    func setupPin() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.tintColor = .black
        textLabel.text = "Pin is correct"
        textLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
