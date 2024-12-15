//
//  TestViewController.swift
//  PracticeDelegate
//
//  Created by Sudeepa Pal on 02/11/24.
//



import UIKit

class TestViewController: UIViewController {

    let textField = UITextField()
    var delegate: TestProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the view
        view.backgroundColor = .white

        // Configure the text field
        textField.placeholder = "Enter a message"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)

        // Configure the submit button
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)

        // Set up constraints
        NSLayoutConstraint.activate([
            // TextField constraints
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            textField.widthAnchor.constraint(equalToConstant: 200),
            
            // Submit button constraints
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Add target for submit button action
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }

    @objc func submitButtonTapped() {
        
        let userInput = textField.text ?? "No Value"
        
        
        let updatedText = "Hello, \(userInput)!"
        print("Submit button tapped with value: \(updatedText)")
        
    
        delegate?.testIng(n: updatedText)
        
    
        self.navigationController?.popViewController(animated: true)
    }
}
