//
//  RegisterViewModel.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
protocol RegisterViewModelInterface {
    func viewDidLoad()
    func createAccount(name:String,user:String,password:String)
    func validate()
}
final class RegisterViewModel {
    
    var fullNameText:String?
    var emailText:String?
    var passwordText:String?
    
    weak var view: RegisterInterface?
    
    
    
}
extension RegisterViewModel:RegisterViewModelInterface{
    func viewDidLoad() {
        view?.configure()
       
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
        

        guard fullNameText.count > 2 else {
            view?.showAlert(title: "Missing username characters.", message: "Your Username has to includes 3 or more characters", buttonTitle: "Ok")
            return
        }
        guard emailText.contains("@") && emailText.contains(".") && emailText.range(of: Register.specialCharacterRegEx, options: .regularExpression) != nil else {
            view?.showAlert(title: "Email Address Wrong", message: "Your email address has to include '@' and at least one special character. ", buttonTitle: "Ok")
            return
        }
        guard passwordText.count >= 6 && passwordText.range(of: Register.capitalLetterRegEx, options: .regularExpression) != nil && passwordText.range(of: Register.numberRegEx, options: .regularExpression) != nil && passwordText.range(of: Register.specialCharacterRegEx, options: .regularExpression) != nil  else {
            view?.showAlert(title: "Password Requirements Not Met", message: "Your password has to be 6 or more characters, include at least one uppercase letter, at least one number, and at least one special character.", buttonTitle: "Ok")
            return
        }
        createAccount(name:fullNameText,user:emailText,password:passwordText)
        
    }
    
    func createAccount(name:String,user:String,password:String) {
        Auth.auth().createUser(withEmail: user, password: password) { [weak self] result, error in
            guard let self = self else{return}
            guard let userId = result?.user.uid else {return}
            self.insertUserRecord(id: userId,name:name,user:user,password:password)
            
        }
        
    }
    private func insertUserRecord(id:String,name:String,user:String,password:String){
        let newUser = User(id: id, name: name, email: user, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
       
//        profileDelegate?.getUserInfos(with: newUser)
//        view?.navigateHome()
    }
    
}
