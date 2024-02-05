//
//  LoginViewController.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit

protocol LoginViewControllerInterface:AnyObject {
    func configure()
    func loginButtonClicked()
    func showAlert(title:String,message:String,buttonTitle:String)
    func getValues(first:String,second:String)
}
final class LoginViewController: UIViewController{
    
    private var loginViewModel:LoginViewModel?
    
    init(viewModel:LoginViewModel){
        super.init(nibName: nil, bundle: nil)
        self.loginViewModel = viewModel
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let headerView = GFHeaderView(titleText: "ToDoMate", subtitleText: "Get Things Done", backgroundColor: .systemPink)
    var usernameTextField = GFTextField(placeholder: "Username",textSecure: false)
    var passwordTextField = GFTextField(placeholder: "Password", textSecure: true)
    let loginButton = GFButton(backgroundColor: .systemBlue, title: "Log in")
    
    let staticLabel = GFBodyLabel(textAlignment: .center, color: .label,text: "New Around Here?")
    let createLabel = GFBodyLabel(textAlignment: .center, color: .systemBlue, text: "Create An Account")
    
    let paddingTP: CGFloat = 20
    let paddingLR:CGFloat = 50
    let paddingButton:CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel?.view = self
        loginViewModel?.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func configureHeader(){
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
    
    func createAccountTapGesture(){
        let createTap = UITapGestureRecognizer(target:self, action: #selector(createActionLabel))
        createLabel.addGestureRecognizer(createTap)
        createLabel.isUserInteractionEnabled = true
    }
    
    @objc func createActionLabel(){
        let register = RegisterViewController()
        navigationController?.pushViewController(register, animated: true)
    }
    @objc func startLogin(){
        print("clicked")
        let changeUsername = usernameTextField.text
        let changePassword = passwordTextField.text
        
        guard let changeUsername = changeUsername, let changePassword = changePassword else {
            return
        }
        switch (changeUsername.count >= 3,changePassword.count >= 6){
        case(false,false):
            showAlert(title: "Username and Password Wrong", message: "Please write your correct username and password", buttonTitle: "Ok")
        case(true,false):
            showAlert(title: "Password short", message: "Please write your correct password", buttonTitle: "Ok")
        case(false,true):
            showAlert(title: "Username short", message: "Please write your correct username", buttonTitle: "Ok")
        default:
            loginViewModel?.usernameText = changeUsername
            loginViewModel?.passwordText = changePassword
            loginViewModel?.login()
        }
       
    }
    
}
extension LoginViewController: LoginViewControllerInterface {
    func configure(){
        view.backgroundColor = .systemBackground
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        configureHeader()
        configureTextFields()
        createDismissKeyboardTapGesture()
        createAccountTapGesture()
        
    }
    func loginButtonClicked(){
       
        loginButton.addTarget(self, action: #selector(startLogin), for: .touchUpInside)
        
    }
    func showAlert(title:String,message:String,buttonTitle:String){
        presentGFAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func getValues(first:String,second:String){
        let home = HomeViewController(task1: first, task2: second)
        navigationController?.pushViewController(home, animated: true)
    }
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
       
//        if changeUsername.count >= 3 && changePassword.count >= 6{
//
//        }
    }

}
