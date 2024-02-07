//
//  HomeViewController.swift
//  ToDoMate
//
//  Created by guncel on 3.02.2024.
//

import UIKit

protocol HomeViewInterface:AnyObject {
    func configure()
    func addToDo()
}
class HomeViewController: UIViewController {
   
    private var homeViewModel: HomeViewModel?
    
    init(viewModel:HomeViewModel){
        super.init(nibName: nil, bundle: nil)
        self.homeViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel?.view = self
        homeViewModel?.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
}
extension HomeViewController:HomeViewInterface{
    
    func configure() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDo))
    }
    @objc func addToDo() {
        let addNew = NewItemViewController(viewModel: NewItemViewModel())
        
        navigationController?.pushViewController(addNew, animated: true)
       
    }
}
