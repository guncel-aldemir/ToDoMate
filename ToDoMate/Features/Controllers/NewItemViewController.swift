//
//  NewItemViewController.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import UIKit



protocol NewItemViewInterface:AnyObject{
    func configure()
    func clickDate()
    func createDate()
    func saveDatas()
    func navigateHome()
    func showAlert(title:String,message:String,buttonTitle:String)
}
class NewItemViewController: UIViewController {
    private var newItemViewModel: NewItemViewModel?
    
    init(viewModel:NewItemViewModel){
        super.init(nibName: nil, bundle: nil)
        self.newItemViewModel = viewModel
    }
    let headerView = GFHeaderView(titleText: "What Do You Do?", subtitleText: "", backgroundColor: .systemOrange)
    lazy var datePicker = GFDatePicker()
    let addTextField =  GFTextField(placeholder: "Add Somehing", textSecure: false)
    let addSubTextField =  GFTextField(placeholder: "Explain Task", textSecure: false)
    let addDateField = GFTextField(placeholder: "Create Your Schedule", textSecure: false)
    let dateLabel = GFSubtitleLabel(textAlignment: .center, fontSize: 16, color: .label, text: "picker Date")
    let saveButton = GFButton(backgroundColor: .systemGreen, title: "Save")
    let pushButton = GFButton(backgroundColor: .systemGreen, title: "Push")
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
        createDismissKeyboardTapGesture()
        createDate()
    }

    func configureFields(){
        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Heights.createAddView)
        ])
        let items = [addTextField,addSubTextField,addDateField,saveButton,pushButton]
        for item in items{
            view.addSubview(item)
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Paddings.paddingLR),
                item.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingLR),
                item.heightAnchor.constraint(equalToConstant: 35)
                
            ])
        }
        NSLayoutConstraint.activate([
            addTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: Paddings.paddingTP),
            addSubTextField.topAnchor.constraint(equalTo: addTextField.bottomAnchor, constant: Paddings.paddingTP),
            addDateField.topAnchor.constraint(equalTo: addSubTextField.bottomAnchor, constant: Paddings.paddingTP),
            
            saveButton.topAnchor.constraint(equalTo: addDateField.bottomAnchor, constant: Paddings.paddingTP),
            pushButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: Paddings.paddingTP),
        ])
        saveButton.addTarget(self, action: #selector(saveDatas), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(navigateHome), for: .touchUpInside)
    }
    func createDate() {    
       let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBTN = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(clickDate))
        toolbar.setItems([doneBTN], animated: true)
        addDateField.inputAccessoryView = toolbar
        addDateField.inputView = datePicker
    }
   @objc  func clickDate() {
      let formatter = DateFormatter()
       formatter.dateStyle = .medium
       formatter.dateFormat = "dd.MM.yyyy HH:mm"
       addDateField.text = formatter.string(from: datePicker.date)
       addTextField.resignFirstResponder()
       self.view.endEditing(true)
   }
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func saveDatas() {
        print(addTextField.text)
        print(addSubTextField.text)
        print(addDateField.text)
        newItemViewModel?.toDoTitle =  addTextField.text
       newItemViewModel?.toDoSubtitle = addSubTextField.text
         newItemViewModel?.toDoDate =  addDateField.text
        newItemViewModel?.getDatas()
        
     
    }
    func showAlert(title:String,message:String,buttonTitle:String){
        presentGFAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    @objc func navigateHome() {
        
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate{
            sceneDelegate.checkAuthentication()
            
        }
    }
}
