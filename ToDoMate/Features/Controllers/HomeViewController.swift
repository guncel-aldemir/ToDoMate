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
    func showValues(with datas:[Todos])
    func showAlert(title:String,message:String,buttonTitle:String)
  
}
class HomeViewController: UIViewController {
 
    private var homeViewModel: HomeViewModel?
    var dateVC:DateView!
    var tableView = GFTableView(cell: ToDoTableViewCell.self, identifier: ToDoTableViewCell.identifier)
    var allDatas = [Todos]()
    var datePass:Date?
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
        print("çalıştı")
        // Do any additional setup after loading the view.
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createChild()
        homeViewModel?.getValues()
        
        print("tekrar oluşturuldu")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        dateVC.willMove(toParent: nil)
        dateVC.view.removeFromSuperview()
        dateVC.removeFromParent()
        print("silindi")
    }
 
}
extension HomeViewController:HomeViewInterface, DateViewDelegate{
    func configure() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDo))
        tableView.delegate = self
        tableView.dataSource = self
       
        createChild()
        createTableView()
        tableView.reloadData()
    }
    func createChild(){
        dateVC = DateView()
        dateVC.delegate = self
        
        addChild(dateVC)
        guard let dateView = dateVC.view else{
            return
        }
        
        view.addSubview(dateView)
        
        dateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    func createTableView(){
        view.addSubview(tableView)
        
       
        guard let dateView = dateVC.view else{
            return
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: dateView.bottomAnchor,constant: Paddings.paddingTP),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: Paddings.paddingLR),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingLR),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    @objc func addToDo() {
        let addNew = NewItemViewController(viewModel: NewItemViewModel())
        navigationController?.pushViewController(addNew, animated: true)
    }
    
    func showValues(with datas: [Todos]) {
        print("datas => \(datas)")
       allDatas = datas
        tableView.reloadData()
    }
    func showAlert(title:String,message:String,buttonTitle:String){
        presentGFAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    func didSelectDate(_ date: Date) {
        print("dates=> asd:: \(date)")
        datePass = date
        print("datepass=> hadi:: \(datePass)")
    }
    
}
extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier, for: indexPath) as! ToDoTableViewCell
        
        let todoName = allDatas[indexPath.row]
        cell.goalTitle.text = todoName.addTodo
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  allDatas.count 
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("deneme")
        }
    }
}


