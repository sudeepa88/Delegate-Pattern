//
//  ViewController.swift
//  PracticeDelegate
//
//  Created by Sudeepa Pal on 02/11/24.
//

import UIKit


protocol TestProtocol{
    func testIng()
}

class ViewController: UIViewController {
    
    var delegate: TestProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .white
        // Create and configure the label
    
        let label = UILabel()
        label.text = "Hello, World!"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)

        // Create and configure the button
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Its Okay", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button2.setTitleColor(.white, for: .normal)
        button2.backgroundColor = .red
        button2.layer.cornerRadius = 8
        button2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button2)

        // Set up constraints for label and button
        NSLayoutConstraint.activate([
            // Center the label horizontally and place it near the top
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),

            // Center the button horizontally and place it below the label
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 44),
            
            
            button2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 44)
        ])

        // Add target for button action
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(filledOut), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("transfer data call")
        
    }
    
    

    @objc func buttonTapped() {
        print("Button was tapped!")
        let testVC = TestViewController()
        testVC.exampleViewController = self
        self.navigationController?.pushViewController(testVC, animated: true)
    }
    
    @objc func filledOut() {
        print("Filled Out is getting called")
        delegate?.testIng()
    }
}


