//
//  GFTableView.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import UIKit

final class GFTableView:UITableView {
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configure()
    }
    convenience init(cell:AnyClass,identifier:String){
        self.init(frame: .zero)
        self.register(cell, forCellReuseIdentifier: identifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
       rowHeight = 60
        translatesAutoresizingMaskIntoConstraints = false
    }
}
