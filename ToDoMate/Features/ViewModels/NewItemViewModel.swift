//
//  NewItemViewModel.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol NewItemViewModelInterface {
    func viewDidLoad()
    func getDatas()
   
}
protocol passNewDataInterface{
    var toDoTitle:String? {get set}
    var toDoSubtitle:String? {get set}
    var toDoDate:String? {get set}
}
final class NewItemViewModel {
    
    weak var view: NewItemViewInterface?
    var toDoTitle:String?
    var toDoSubtitle:String?
    var toDoDate:String? 
    
}


extension NewItemViewModel:NewItemViewModelInterface, passNewDataInterface{
    func viewDidLoad() {
        print("view did load çalıştı")
        view?.configure()
    }
    func getDatas() {
        print("title:=>\(toDoTitle)")
        print("subtitle:=>\(toDoSubtitle)")
        print("date:=>\(toDoDate)")
        
        let mainGoal = toDoTitle
        let mainDesc = toDoSubtitle
        let mainDate = toDoDate
        
        guard let mainGoal = mainGoal, let mainDesc = mainDesc, let mainDate = mainDate else {
            return
        }
        
        guard !mainGoal.isEmpty else {
            view?.showAlert(title: "Empty Todo Field", message: "Please ensure your todo field not empty!", buttonTitle: "Ok")
            return
        }
        
       
        guard !mainDate.isEmpty  else {
            view?.showAlert(title: "Empty Date Field", message: "Please select your goal time!", buttonTitle: "Ok")
            return
        }
        
        guard let uuid = Auth.auth().currentUser?.uid else {
            return
        }
        let newId = UUID().uuidString
        let newItem = Todos(addTodo: mainGoal, addDescToDo: mainDesc, dueDate: mainDate, createdDate: Date().timeIntervalSince1970, isDone: false)
        let db = Firestore.firestore()
        db.collection("users").document(uuid).collection("todos").document(newId).setData(newItem.asDictionary())
        //view?.showAlert(title: "Success", message: "Your goal added.", buttonTitle: "Ok")
        view?.navigateHome()
    }
}
