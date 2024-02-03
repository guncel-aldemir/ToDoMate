//
//  LoginViewModel.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import Foundation

protocol LoginViewInterface:AnyObject {
    var view:LoginViewControllerInterface? {get set}
}
final class LoginViewModel {
    
    weak var view: LoginViewControllerInterface?
    
    
    
    
    
}
