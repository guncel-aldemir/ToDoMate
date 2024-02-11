//
//  DateCollectionViewCell.swift
//  ToDoMate
//
//  Created by guncel on 10.02.2024.
//

import UIKit


class DateCollectionViewCell:UICollectionViewCell{
    
    static let identifier = "identifier cell"
    
    
    let dayNumLabel = GFBodyLabel(textAlignment: .center, color: .label, text: "1")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        addSubview(dayNumLabel)
            dayNumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dayNumLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dayNumLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dayNumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dayNumLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
}
