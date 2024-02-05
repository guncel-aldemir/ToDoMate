//
//  RegisterViewController.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit
protocol RegisterInterface:AnyObject{
    func configure()
    func register()
    func showAlert(title:String,message:String,buttonTitle:String)
    func navigateHome()
}
class RegisterViewController: UIViewController {

    private var registerViewModel : RegisterViewModel?
    
    init(registerViewModel:RegisterViewModel){
        super.init(nibName: nil, bundle: nil)
        self.registerViewModel = registerViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let headerView = GFHeaderView(titleText: "Register", subtitleText: "Start Organizing todos", backgroundColor: .systemOrange)
    let createFullTextField = GFTextField(placeholder: "Full Name", textSecure: false)
    let createEmailTextField = GFTextField(placeholder: "Email Address", textSecure: false)
    let createPasswordTextField = GFTextField(placeholder: "Password", textSecure: true)
    let createButton = GFButton(backgroundColor: .systemGreen, title: "Create Account")

    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewModel?.view = self
        registerViewModel?.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func configureTextFields(){
        view.addSubviews(createFullTextField,createEmailTextField,createPasswordTextField,createButton)
      let items = [createFullTextField,createEmailTextField,createPasswordTextField]
        for item in items {
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:Paddings.paddingLR ),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingLR),
                item.heightAnchor.constraint(equalToConstant: Heights.registerButtonHeight),
            ])
            item.delegate = self
        }
        
        NSLayoutConstraint.activate([
            createFullTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Paddings.paddingTP),
            createEmailTextField.topAnchor.constraint(equalTo: createFullTextField.bottomAnchor, constant: Paddings.paddingTP),
            createPasswordTextField.topAnchor.constraint(equalTo: createEmailTextField.bottomAnchor, constant: Paddings.paddingTP),
            
            createButton.topAnchor.constraint(equalTo: createPasswordTextField.bottomAnchor, constant: Paddings.paddingTP),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Paddings.paddingButton),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingButton),
            createButton.heightAnchor.constraint(equalToConstant: Heights.registerButtonHeight)
        ])
    }
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension RegisterViewController:RegisterInterface{
     func configure(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
         createButton.click(targetOne: self, action: #selector(register), controlEvents: .touchUpInside)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Heights.headerViewHeight)
        ])
        configureTextFields()
        createDismissKeyboardTapGesture()
    }
    
    @objc func register() {
        print("clickeddd")


        registerViewModel?.fullNameText = createFullTextField.text
        registerViewModel?.emailText = createEmailTextField.text
        registerViewModel?.passwordText = createPasswordTextField.text 
  
        registerViewModel?.validate()
        
    }
    func showAlert(title: String, message: String, buttonTitle: String) {
        presentGFAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func navigateHome() {
        let home = HomeViewController()
        navigationController?.pushViewController(home, animated: true)
    }
}
extension RegisterViewController:UITextFieldDelegate{

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("name: => \(createFullTextField.text)")
        print("name: => \(createEmailTextField.text)")
        print("name: => \(createPasswordTextField.text)")
     
        
    }
    
}
