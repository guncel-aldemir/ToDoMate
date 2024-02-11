//
//  LoginViewController.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit

protocol LoginViewControllerInterface:AnyObject {
    func configure()
   // func loginButtonClicked()
    func showAlert(title:String,message:String,buttonTitle:String)
    func getValues()
    
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
    var emailTextField = GFTextField(placeholder: "Email",textSecure: false)
    var passwordTextField = GFTextField(placeholder: "Password", textSecure: true)
    let loginButton = GFButton(backgroundColor: .systemBlue, title: "Log in")
    
    let staticLabel = GFBodyLabel(textAlignment: .center, color: .label,text: "New Around Here?")
    let createLabel = GFBodyLabel(textAlignment: .center, color: .systemBlue, text: "Create An Account")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel?.view = self
        loginViewModel?.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func configureHeader(){
        view.addSubview(headerView)
        
       // headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Heights.headerViewHeight)
        ])
    }
    
    fileprivate func configureTextFields(){
        view.addSubviews(emailTextField,passwordTextField,loginButton,staticLabel,createLabel)
        
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Paddings.paddingTP),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Paddings.paddingLR),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingLR),
            emailTextField.heightAnchor.constraint(equalToConstant: Heights.loginButtonHeight),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Paddings.paddingTP),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Paddings.paddingLR),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingLR),
            passwordTextField.heightAnchor.constraint(equalToConstant: Heights.loginButtonHeight),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Paddings.paddingTP),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Paddings.paddingButton),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingButton),
            loginButton.heightAnchor.constraint(equalToConstant: Heights.loginButtonHeight),
            
            staticLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Paddings.paddingTP),
            staticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            staticLabel.heightAnchor.constraint(equalToConstant: Heights.staticLabelHeight),
            
            createLabel.topAnchor.constraint(equalTo: staticLabel.bottomAnchor, constant: (Paddings.paddingTP) / 2),
            createLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createLabel.heightAnchor.constraint(equalToConstant: Heights.staticLabelHeight),
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
        print("clicked 3")
        let register = RegisterViewController(registerViewModel: RegisterViewModel())
       
      navigationController?.pushViewController(register, animated: true)
        print("clicked 4")
    }
    @objc func startLogin(){
        print("clicked")
        loginViewModel?.emailText = emailTextField.text
        loginViewModel?.passwordText = passwordTextField.text
        loginViewModel?.login()
        
       
    }
    
}
extension LoginViewController: LoginViewControllerInterface {
    func configure(){
        view.backgroundColor = .systemBackground
        emailTextField.delegate = self
        passwordTextField.delegate = self
        configureHeader()
        configureTextFields()
        createDismissKeyboardTapGesture()
        createAccountTapGesture()
        loginButton.addTarget(self, action: #selector(startLogin), for: .touchUpInside)
    }
    func loginButtonClicked(){
       
        
        
    }
    func showAlert(title:String,message:String,buttonTitle:String){
        presentGFAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func getValues(){
        print("çalıştı")
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate{
            sceneDelegate.checkAuthentication()
            
        }

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
