//
//  HomeViewController.swift
//  ToDoMate
//
//  Created by guncel on 3.02.2024.
//

import UIKit

class HomeViewController: UIViewController {
    var task1: String?
    var task2:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
        print("task1=> \(task1)")
        print("task2=> \(task2)")
    }
    
    convenience init(task1:String? = nil,task2:String? = nil){
        self.init(nibName: nil, bundle: nil)
        self.task1 = task1
        self.task2 = task2
    }
    

}
