//
//  LoginViewController.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit

protocol LoginViewControllerInterface:AnyObject {
    
}
class LoginViewController: UIViewController {
    
    var loginModel:LoginViewModel?
    
    init(loginViewModel:LoginViewModel){
        super.init(nibName: nil, bundle: nil)
        self.loginModel = loginViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let headerView = GFHeaderViewController()
    let usernameTextField = GFTextField(placeholder: "Username",textSecure: false)
    let passwordTextField = GFTextField(placeholder: "Password", textSecure: true)
    let loginButton = GFButton(backgroundColor: .systemBlue, title: "Log in")
    let staticLabel = GFBodyLabel(textAlignment: .center, color: .label,text: "New Around Here?", userInteraction: false)
    let createLabel = GFBodyLabel(textAlignment: .center, color: .systemBlue, text: "Create An Account", userInteraction: true)
    
    let paddingTP: CGFloat = 20
    let paddingLR:CGFloat = 50
    let paddingButton:CGFloat = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTextFields()
        createDismissKeyboardTapGesture()
        createAccoundTapGesture()
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
        view.addSubviews(usernameTextField,passwordTextField,loginButton,staticLabel,createLabel)
      
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: paddingTP),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: paddingLR),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -paddingLR),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: paddingTP),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: paddingLR),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -paddingLR),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: paddingTP),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: paddingButton),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -paddingButton),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            staticLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: paddingButton),
            staticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            staticLabel.heightAnchor.constraint(equalToConstant: 20),
            
            createLabel.topAnchor.constraint(equalTo: staticLabel.bottomAnchor, constant: (paddingTP) / 2),
            createLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    func createAccoundTapGesture(){
        let tap = UITapGestureRecognizer(target:self.createLabel, action: #selector(createAccount))
        createLabel.isUserInteractionEnabled = true
        createLabel.addGestureRecognizer(tap)
    }
    
    @objc func createAccount(){
        print("create account func worked")
    }
    
}
