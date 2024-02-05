//
//  LoginViewModel.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import Foundation

protocol LoginViewInterface:AnyObject {
    
  // var view:LoginViewControllerInterface? {get set}
//    var usernameText:String? {get set}
//    var passwordText:String? {get set}
    func login()
    func viewDidLoad()
}
final class LoginViewModel {
    var usernameText:String?
    var passwordText:String?
    
    weak var view: LoginViewControllerInterface?

     func validate(){
        
    }
    
    
}
extension LoginViewModel:LoginViewInterface {
    func viewDidLoad() {
        view?.configure()
        view?.loginButtonClicked()
    }
    
    
    func login(){
        print("username: => \(usernameText)")
          print("password: => \(passwordText)")
        view?.getValues(first: usernameText!, second: passwordText!)
//      guard let view = view, let usernameText = usernameText, let passwordText = passwordText else {
//          return
//      }

//      switch(usernameText.trimmingCharacters(in: .whitespaces),passwordText.trimmingCharacters(in: .whitespaces)){
//      case (nil,nil):
//          view.showAlert(title: "Empty Username and Password", message: "Please Enter Your Username and Password ", buttonTitle: "Ok")
//      case (_,nil):
//          view.showAlert(title: "Empty Password", message: "Please Enter Your Password ", buttonTitle: "Ok")
//      case (nil,_):
//          view.showAlert(title: "Empty Username", message: "Please Enter Your Username ", buttonTitle: "Ok")
//      default:
//          break
//      }
//      guard !usernameText.trimmingCharacters(in: .whitespaces).isEmpty, !passwordText.trimmingCharacters(in: .whitespaces).isEmpty else { return}
  }
}
