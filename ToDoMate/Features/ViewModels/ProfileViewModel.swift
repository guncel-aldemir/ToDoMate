//
//  ProfileViewModel.swift
//  ToDoMate
//
//  Created by guncel on 6.02.2024.
//

import Foundation
import FirebaseAuth

protocol ProfileViewModelInterface {
    func viewDidLoad()
    func logoutAccount()->Bool
    func presentLogin()
    
}
final class ProfileViewModel{
     weak var view:ProfileInterface?
}

extension ProfileViewModel:ProfileViewModelInterface{
    
    func viewDidLoad() {
        view?.configure()
        
    }
   
    func logoutAccount() -> Bool{
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                presentLogin()
               return true
            }catch{
                print("can not sign out ")
                return false
            }
        }
        return false
    }
    func presentLogin() {
        
//        let loginVC = LoginViewController(viewModel: LoginViewModel())
//        loginVC.modalPresentationStyle = .fullScreen
      view?.loginStart()
    }
}
