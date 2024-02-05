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
    func logoutAccount()
    
}
final class ProfileViewModel{
     weak var view:ProfileInterface?
}

extension ProfileViewModel:ProfileViewModelInterface{
    
    func viewDidLoad() {
        view?.configure()
        
    }
   
    func logoutAccount(){
        print("girdi")
        do {
            try Auth.auth().signOut()
            print("bitirdi")
        }catch{
            print("hata var")
        }
    }
}
