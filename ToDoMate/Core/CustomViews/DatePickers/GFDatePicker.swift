//
//  GFDatePicker.swift
//  ToDoMate
//
//  Created by guncel on 7.02.2024.
//

import UIKit


final class GFDatePicker:UIDatePicker{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configure(){
        datePickerMode = .dateAndTime
        preferredDatePickerStyle = .inline
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
   
   
}
