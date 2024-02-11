//
//  ToDoTableViewCell.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    static let identifier = "tableview identifier"
    let goalTitle = GFTitleLabel(textAlignment: .left, fontSize: 18, color: .label, text:"Label")
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configure(){
        addSubview(goalTitle)
       // translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            goalTitle.topAnchor.constraint(equalTo: self.topAnchor),
            goalTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            goalTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            goalTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

}
