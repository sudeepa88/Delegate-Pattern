//
//  TestViewController.swift
//  PracticeDelegate
//
//  Created by Sudeepa Pal on 02/11/24.
//

import UIKit



class TestViewController: UIViewController, TestProtocol{
    
    
    
   


    let textField = UITextField()
    var newVar = ""
   
    
    var exampleViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the background color
        view.backgroundColor = .white


        exampleViewController.delegate = self
        
        
        
        // Create and configure the text field
        //let textField = UITextField()
        textField.placeholder = "Enter a number"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)

        // Create and configure the submit button
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)

        // Set up constraints for textField and submitButton
        NSLayoutConstraint.activate([
            // Center the text field horizontally and place it near the center
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            textField.widthAnchor.constraint(equalToConstant: 200),

            // Center the submit button horizontally and place it below the text field
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        // Add target for the submit button action
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }

    @objc func submitButtonTapped() {
        // Handle the submit button action
        newVar = textField.text ?? "No Value"
        print("Submit button was tapped!", textField.text ?? "No Value")
    }
    
    func testIng() {
        print("Here it is", newVar)
    }
    
}

