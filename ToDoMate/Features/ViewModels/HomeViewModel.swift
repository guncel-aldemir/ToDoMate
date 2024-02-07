//
//  HomeViewModel.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import Foundation

protocol HomeViewModelInterface:AnyObject {
    func viewDidLoad()
    func addList()
}
final class HomeViewModel {
    weak var view : HomeViewInterface?
    
    
    
}
extension HomeViewModel:HomeViewModelInterface {
    func viewDidLoad() {
        view?.configure()
    }
    func addList() {
        
    }
}
