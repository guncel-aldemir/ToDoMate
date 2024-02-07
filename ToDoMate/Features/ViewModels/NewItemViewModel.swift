//
//  NewItemViewModel.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import Foundation

protocol NewItemViewModelInterface {
    func viewDidLoad()
}
final class NewItemViewModel {
    
    weak var view: NewItemViewInterface?
    
    
}


extension NewItemViewModel:NewItemViewModelInterface{
    func viewDidLoad() {
        print("view did load çalıştı")
        view?.configure()
    }
}
