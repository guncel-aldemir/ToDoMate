//
//  GFBodyLabel.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit


final class GFBodyLabel:UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, color:UIColor,text:String){
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.textColor = color
        self.text = text
       
    }
    private func configure(){
        
        adjustsFontSizeToFitWidth = true
        adjustsFontForContentSizeCategory = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
}
