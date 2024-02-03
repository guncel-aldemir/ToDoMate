//
//  GFSubtitleLabel.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit
final class GFSubtitleLabel:UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    convenience init(textAlignment:NSTextAlignment,fontSize:CGFloat,color:UIColor,text:String){
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        self.textColor = color
        self.text = text
    }

    private func configure(){
        
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}

