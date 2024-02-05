//
//  RegisterViewController.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit

class RegisterViewController: UIViewController {

    
    let headerView = GFHeaderView(titleText: "Register", subtitleText: "Start Organizing todos", backgroundColor: .systemOrange)
    let createFullTextField = GFTextField(placeholder: "Full Name", textSecure: false)
    let createEmailTextField = GFTextField(placeholder: "Email Address", textSecure: false)
    let createPasswordTextField = GFTextField(placeholder: "Password", textSecure: true)
    let createButton = GFButton(backgroundColor: .systemGreen, title: "Create Account")
    let paddingTP: CGFloat = 20
    let paddingLR:CGFloat = 50
    let paddingButton:CGFloat = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTextFields()
        createDismissKeyboardTapGesture()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func configure(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    fileprivate func configureTextFields(){
        view.addSubviews(createFullTextField,createEmailTextField,createPasswordTextField,createButton)
      let items = [createFullTextField,createEmailTextField,createPasswordTextField]
        for item in items {
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: paddingLR),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -paddingLR),
                item.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
        
        NSLayoutConstraint.activate([
            createFullTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: paddingTP),
            createEmailTextField.topAnchor.constraint(equalTo: createFullTextField.bottomAnchor, constant: paddingTP),
            createPasswordTextField.topAnchor.constraint(equalTo: createEmailTextField.bottomAnchor, constant: paddingTP),
            
            createButton.topAnchor.constraint(equalTo: createPasswordTextField.bottomAnchor, constant: paddingTP),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: paddingButton),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -paddingButton),
            createButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}
