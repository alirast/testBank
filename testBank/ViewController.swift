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
    
    var circles = [UIButton]()
    
    var stackViewOfButtons = UIStackView()
    
    var keyButtons = [UIButton]()
    
    var stackViewOfNumbers = UIStackView()
    
    var password = [String]()
    let correctPassword = "1234"
    
    var selectedCircles = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .brown
    
        view.addSubview(stackViewOfButtons)
        setupStackButtons()
        
        setupStackKeys()
    }
    
    func setupStackKeys() {
        let firstRowStackView = UIStackView()
        var firstRowKeys = [UIButton]()
        
        view.addSubview(firstRowStackView)
        
        for number in 1...3 {
            let button = UIButton(type: .system)
            button.setTitle("\(number)", for: .normal)
            button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 40)
            button.tintColor = .black
            button.layer.borderWidth = 1
            
            button.addTarget(self, action: #selector(numberKeyTapped(sender:)), for: .touchUpInside)
            view.addSubview(button)
            firstRowKeys.append(button)
            keyButtons.append(button)
        }
        
        firstRowStackView.axis = .horizontal
        firstRowStackView.alignment = .center
        firstRowStackView.distribution = .fillEqually
        firstRowStackView.spacing = -1
        
        for key in firstRowKeys {
            firstRowStackView.addArrangedSubview(key)
        }
        
        firstRowStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstRowStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstRowStackView.topAnchor.constraint(equalTo: stackViewOfButtons.bottomAnchor, constant: 50),
            firstRowStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
        
        let secondRowStackView = UIStackView()
        var secondRowKeys = [UIButton]()
        view.addSubview(secondRowStackView)
        
        for number in 4...6 {
            let button = UIButton(type: .system)
            button.setTitle("\(number)", for: .normal)
            button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 40)
            button.tintColor = .black
            button.layer.borderWidth = 1
            button.addTarget(self, action: #selector(numberKeyTapped(sender:)), for: .touchUpInside)
            view.addSubview(button)
            secondRowKeys.append(button)
            keyButtons.append(button)
        }
        
        secondRowStackView.axis = .horizontal
        secondRowStackView.alignment = .center
        secondRowStackView.distribution = .fillEqually
        secondRowStackView.spacing = -1
        
        for key in secondRowKeys {
            secondRowStackView.addArrangedSubview(key)
        }
        
        secondRowStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondRowStackView.topAnchor.constraint(equalTo: firstRowStackView.bottomAnchor),
            secondRowStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondRowStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        let thirdRowStackView = UIStackView()
        var thirdRowKeys = [UIButton]()
        
        view.addSubview(thirdRowStackView)
        
        for number in 7...9 {
            let button = UIButton(type: .system)
            button.setTitle("\(number)", for: .normal)
            button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 40)
            button.tintColor = .black
            button.layer.borderWidth = 1
            button.addTarget(self, action: #selector(numberKeyTapped(sender:)), for: .touchUpInside)
            view.addSubview(button)
            thirdRowKeys.append(button)
            keyButtons.append(button)
        }
        
        thirdRowStackView.axis = .horizontal
        thirdRowStackView.alignment = .center
        thirdRowStackView.distribution = .fillEqually
        thirdRowStackView.spacing = -1
        
        for key in thirdRowKeys {
            thirdRowStackView.addArrangedSubview(key)
        }
        
        thirdRowStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdRowStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdRowStackView.topAnchor.constraint(equalTo: secondRowStackView.bottomAnchor),
            thirdRowStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        let lastRowStackView = UIStackView()
        var lastRowKeys = [UIButton]()
        view.addSubview(lastRowStackView)
        
        let zeroKey = UIButton(type: .system)
        zeroKey.setTitle("0", for: .normal)
        zeroKey.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 40)
        zeroKey.tintColor = .black
        zeroKey.layer.borderWidth = 1
        zeroKey.addTarget(self, action: #selector(numberKeyTapped(sender:)), for: .touchUpInside)
        view.addSubview(zeroKey)
        lastRowKeys.append(zeroKey)
        keyButtons.append(zeroKey)
        
        let clearKey = UIButton(type: .system)
        clearKey.setTitle("Clear", for: .normal)
        clearKey.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 40)
        clearKey.tintColor = .black
        clearKey.layer.borderWidth = 1
        clearKey.addTarget(self, action: #selector(clear), for: .touchUpInside)
        view.addSubview(clearKey)
        lastRowKeys.append(clearKey)
        
        lastRowStackView.axis = .horizontal
        lastRowStackView.alignment = .center
        lastRowStackView.distribution = .fillEqually
        lastRowStackView.spacing = -1
        
        for key in lastRowKeys {
            lastRowStackView.addArrangedSubview(key)
        }
        
        lastRowStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastRowStackView.topAnchor.constraint(equalTo: thirdRowStackView.bottomAnchor),
            lastRowStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastRowStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])

    }
    
    @objc func numberKeyTapped(sender: UIButton) {
        print("number tapped")
        guard let currentNumber = sender.currentTitle else { return }
        print("current number", currentNumber)
        password.append(currentNumber)
        print("password", password)
        selectedCircles.append(1)
        print("selected circles", selectedCircles)
        switch selectedCircles.count {
        case 1:
            firstCircle.backgroundColor = .blue
        case 2:
            secondCircle.backgroundColor = .blue
        case 3:
            thirdCircle.backgroundColor = .blue
        default:
            fourthCircle.backgroundColor = .blue
        }
        
        guard password.count >= 4 else { return }
        print(password.count)
        keyButtons.map({ $0.isUserInteractionEnabled = false; $0.tintColor = .gray; $0.layer.borderColor = UIColor.gray.cgColor })
        
        if password.joined() == correctPassword {
            print("correct password")
            print("selected circles count", selectedCircles.count)
            selectedCircles.removeAll()
            print("circles count", circles.count)
            circles.map({ $0.layer.borderColor = UIColor.green.cgColor; $0.backgroundColor = .green })
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
                    self.navigationController?.pushViewController(secondVC, animated: true)
                }
            }
        } else if password.joined() != correctPassword {
            print("not correct password")
            print("selected circles count", selectedCircles.count)
            selectedCircles.removeAll()
            circles.map({ $0.layer.borderColor = UIColor.red.cgColor; $0.backgroundColor = .red })
            let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
            present(alert, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                alert.dismiss(animated: true)
                self.keyButtons.map({ $0.isUserInteractionEnabled = true; $0.tintColor = .black; $0.layer.borderColor = UIColor.black.cgColor })
                self.circles.map({ $0.layer.borderColor = UIColor.black.cgColor; $0.backgroundColor = .white })
                self.password.removeAll()
            }
        }
    }
    
    @objc func clear() {
        password.removeLast()
        var array = [Int]()
        for i in 0...selectedCircles.count - 1 {
            array.append(i)
        }
        circles[array.last!].backgroundColor = .white
        selectedCircles.remove(at: array.last!)
        print("NEW PASSWORD", password)
    }
    
    func setupStackButtons() {
        circles = [firstCircle, secondCircle, thirdCircle, fourthCircle]
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
        
        for circle in circles {
            stackViewOfButtons.addArrangedSubview(circle)
        }
        
        stackViewOfButtons.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewOfButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewOfButtons.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
}

