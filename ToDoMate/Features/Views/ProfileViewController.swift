//
//  ProfileViewController.swift
//  ToDoMate
//
//  Created by guncel on 3.02.2024.
//

import UIKit

protocol ProfileInterface:AnyObject {
    func configure()
    func register()
}
class ProfileViewController: UIViewController {
   
    private var profileViewModel: ProfileViewModel?
    
    init(profileViewModel:ProfileViewModel){
        super.init(nibName: nil, bundle: nil)
        self.profileViewModel = profileViewModel
    }
    let headerView = GFHeaderView(titleText: "Profile", subtitleText: "What Do You Want?", backgroundColor: .systemGreen)
    let logoutButton = GFButton(backgroundColor: .systemRed, title: "Logout Your Account")
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewModel?.view = self
        profileViewModel?.viewDidLoad()
        
       print("çalıştı")
        
        // Do any additional setup after loading the view.
    }

}

extension ProfileViewController:ProfileInterface{

    func configure() {
        
        view.addSubview(headerView)
        view.backgroundColor = .systemBackground
       
        headerView.translatesAutoresizingMaskIntoConstraints = false
       logoutButton.click(targetOne: self, action: #selector(register), controlEvents: .touchUpInside)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Heights.headerViewHeight)
        ])
        configureButton()
    }
    func configureButton(){
        view.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Paddings.paddingTP),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Paddings.paddingButton),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Paddings.paddingButton),
            logoutButton.heightAnchor.constraint(equalToConstant: Heights.registerButtonHeight)
        ])
    }
    @objc func register() {
        print("register clicked")
        profileViewModel?.logoutAccount()
    }
}
