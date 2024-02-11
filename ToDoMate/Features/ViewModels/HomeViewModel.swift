//
//  HomeViewModel.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol HomeViewModelInterface:AnyObject {
    func viewDidLoad()
    func getValues()
    
}
final class HomeViewModel {
    weak var view : HomeViewInterface?
    weak var homeDelegate: HomeViewModelInterface?
    var mainTitle:String?
    var mainDesc:String?
    var mainDate:String?
    var modelDatas = [Todos]()
    

}
extension HomeViewModel:HomeViewModelInterface {
    func viewDidLoad() {
        view?.configure()
       
    }
    func getValues(){
        guard let uuid = Auth.auth().currentUser?.uid else {
            return
        }
        //let newId = UUID().uuidString
        let db = Firestore.firestore()
        let collectionRef = db.collection("users").document(uuid).collection("todos")
       
        collectionRef.getDocuments { [weak self] snapshot, error in
            guard let self = self else {return}
           guard error == nil else {
               return
            }
            guard let documents = snapshot?.documents else {
                    print("No documents found")
                    return
                }
            for document in documents {
                        let data = document.data()
                        print(type(of: data))
                        guard let addTodo = data["addTodo"] as? String,
                              let addDescToDo = data["addDescToDo"] as? String,
                              let dueDate = data["dueDate"] as? String,
                              let createdDate = data["createdDate"] as? TimeInterval,
                              let isDone = data["isDone"] as? Bool else {
                            print("Invalid data format in document \(document.documentID)")
                           return
                        }
                let todoItem = Todos(addTodo: addTodo, addDescToDo: addDescToDo, dueDate: dueDate, createdDate: createdDate, isDone: isDone)
               
                self.modelDatas.append(todoItem)
            }
            
            self.view?.showValues(with: self.modelDatas)
        }
        
    }
    
    
    func deleteValue(){
       
    }
    
}


