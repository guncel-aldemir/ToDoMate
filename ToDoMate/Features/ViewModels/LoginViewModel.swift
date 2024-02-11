//
//  LoginViewModel.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
protocol LoginViewInterface:AnyObject {
    func login()
    func viewDidLoad()
    func validate(user:String,password:String)
}
final class LoginViewModel {
    var emailText:String?
    var passwordText:String?
    
    weak var view: LoginViewControllerInterface?
    weak var loginDelegate:LoginViewInterface?
}
extension LoginViewModel:LoginViewInterface {
    func viewDidLoad() {
        view?.configure()
        //view?.loginButtonClicked()
    }
    
    
    func login(){
        print("email: => \(emailText)")
        print("password: => \(passwordText)")
        let changeEmail = emailText
        let changePassword = passwordText
        guard let changeEmail = changeEmail, let changePassword = changePassword else {
            return
        }

        guard changeEmail.contains("@") && changeEmail.contains(".") && changeEmail.range(of: Register.specialCharacterRegEx, options: .regularExpression) != nil else {
            view?.showAlert(title: "Email Address Wrong", message: "Your email address has to include '@' and at least one special character. ", buttonTitle: "Ok")
            return
        }
        guard changePassword.count >= 6 && changePassword.range(of: Register.capitalLetterRegEx, options: .regularExpression) != nil && changePassword.range(of: Register.numberRegEx, options: .regularExpression) != nil && changePassword.range(of: Register.specialCharacterRegEx, options: .regularExpression) != nil  else {
            view?.showAlert(title: "Password Requirements Not Met", message: "Your password has to be 6 or more characters, include at least one uppercase letter, at least one number, and at least one special character.", buttonTitle: "Ok")
            return
        }
        let db = Firestore.firestore()
        
        // Perform a query to check if a document with the given email and password exists
        db.collection("users")
            .whereField("email", isEqualTo: changeEmail)
            .whereField("password", isEqualTo: changePassword)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error querying Firestore: \(error.localizedDescription)")
                    return
                }
                
                // Check if there is a matching document
                if let document = querySnapshot?.documents.first {
                    // Document found, proceed with signing in
                    self.validate(user: changeEmail, password: changePassword)
                } else {
                    // No matching document, show an error
                    self.view?.showAlert(title: "Invalid Credentials", message: "Email or password is incorrect", buttonTitle: "Ok")
                }
            }
       

        
    }
    func validate(user:String,password:String){
        Auth.auth().signIn(withEmail: user, password: password) { _, error in
          
            if let error = error {
                print(error.localizedDescription)
                self.view?.showAlert(title: "Sign In Failed", message: "Check your email and password", buttonTitle: "Ok")
            }else{
                self.view?.getValues()
            }
           
        }
    }
}
