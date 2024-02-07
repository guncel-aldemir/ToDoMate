//
//  NewItemViewController.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import UIKit
import SwiftUI


protocol NewItemViewInterface:AnyObject{
    func configure()
    func clickDate()
    func createDate()
}
class NewItemViewController: UIViewController {
    private var newItemViewModel: NewItemViewModel?
    
    init(viewModel:NewItemViewModel){
        super.init(nibName: nil, bundle: nil)
        self.newItemViewModel = viewModel
    }
    //let headerView = GFHeaderView(titleText: "What Do You Do?", subtitleText: "", backgroundColor: .systemOrange)
    let datePicker = GFDatePicker()
    let addTextField =  GFTextField(placeholder: "Add Somehing", textSecure: false)
    let dateLabel = GFSubtitleLabel(textAlignment: .center, fontSize: 16, color: .label, text: "picker Date")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemViewModel?.view = self
        newItemViewModel?.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
extension NewItemViewController:NewItemViewInterface{
  
    
    func configure() {
        view.backgroundColor = .systemBackground
        
        title = "Add To Do"
        navigationController?.navigationBar.prefersLargeTitles = false
       
        configureFields()
    }

    func configureFields(){
        let items = [addTextField,datePicker]
        for item in items{
            view.addSubview(item)
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Paddings.paddingLR),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingLR),

            ])
        }
        NSLayoutConstraint.activate([
            addTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: Paddings.paddingTP),
            addTextField.heightAnchor.constraint(equalToConstant: 30),
            datePicker.topAnchor.constraint(equalTo: addTextField.bottomAnchor, constant: Paddings.paddingTP)
        ])
    }
    func createDate() {
        let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let doneBTN = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(clickDate))
        addTextField.inputAccessoryView = toolBar
        addTextField.inputView = datePicker
        
    }
   @objc  func clickDate() {
       let formatter = DateFormatter()
       formatter.dateStyle = .medium
       formatter.dateFormat = "dd.MM.yyyy"
       addTextField.text = formatter.string(from: datePicker.date)
    }
    
  

}
