//
//  RegisterViewModel.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import Foundation

protocol RegisterViewModelInterface {
    func viewDidLoad()
    func createAccount()
    func validate()
}
final class RegisterViewModel {
    
    var fullNameText:String?
    var emailText:String?
    var passwordText:String?
    
    weak var view: RegisterInterface?
    
    
}
extension RegisterViewModel:RegisterViewModelInterface{
    func createAccount() {
        print("boş")
        
    }
    func validate() {
        print("validate çalıştı")
        guard !fullNameText!.trimmingCharacters(in: .whitespaces).isEmpty,
              !emailText! .trimmingCharacters(in: .whitespaces).isEmpty,
              !passwordText!.trimmingCharacters(in: .whitespaces).isEmpty else {
                  print("validate girdi buraya ")
                  view?.showAlert(title: "Something went Wrong", message: "Somehting goes wrong please ensure enter values correct.", buttonTitle: "Ok")

                  return
              }
        guard let fullNameText = fullNameText, let emailText = emailText, let passwordText = passwordText else {
            return
        }
        print("validate devam")
       
        print("views model : \(fullNameText)")
        print("views model : \(emailText)")
        print("views model : \(passwordText)")
        let capitalLetterRegEx  = "[A-Z]+"
        let numberRegEx  = "[0-9]+"
        let specialCharacterRegEx  = "[.*&^%$#@()/]+"

        guard fullNameText.count > 2 else {
            view?.showAlert(title: "Missing username characters.", message: "Your Username has to includes 3 or more characters", buttonTitle: "Ok")
            return
        }
        guard emailText.contains("@") && emailText.contains(".") && emailText.range(of: specialCharacterRegEx, options: .regularExpression) != nil else {
            view?.showAlert(title: "Email Address Wrong", message: "Your email address has to include '@' and at least one special character. ", buttonTitle: "Ok")
            return
        }
        guard passwordText.count >= 6 && passwordText.range(of: capitalLetterRegEx, options: .regularExpression) != nil && passwordText.range(of: numberRegEx, options: .regularExpression) != nil && passwordText.range(of: specialCharacterRegEx, options: .regularExpression) != nil  else {
            view?.showAlert(title: "Password Requirements Not Met", message: "Your password has to be 6 or more characters, include at least one uppercase letter, at least one number, and at least one special character.", buttonTitle: "Ok")
            return
        }
        

createAccount()
        
    }
    func viewDidLoad() {
        view?.configure()
       
    }
}
