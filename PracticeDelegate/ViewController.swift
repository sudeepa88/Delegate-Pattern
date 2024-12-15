//
//  ViewController.swift
//  PracticeDelegate
//
//  Created by Sudeepa Pal on 02/11/24.
//

import UIKit


protocol TestProtocol {
    func testIng(n: String)
}

class ViewController: UIViewController, TestProtocol {
    
    
    let label = UILabel()
    var textEtc = "Hello, World!" // Default text
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        
        // Configure the label
        label.text = textEtc
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // Configure the button
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Label constraints
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            // Button constraints
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Add target for button action
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        label.text = textEtc
    }
    
    
    @objc func buttonTapped() {
        let testVC = TestViewController()
        testVC.delegate = self
        self.navigationController?.pushViewController(testVC, animated: true)
    }
    
    
    func testIng(n: String) {
        textEtc = n
        label.text = n 
    }
}

