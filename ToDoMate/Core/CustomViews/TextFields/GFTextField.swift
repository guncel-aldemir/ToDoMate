//
//  GFTextFields.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit


final class GFTextField:UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder:String, textSecure:Bool){
        self.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = textSecure
        guard textSecure == false else {
            textContentType = .password
            return
        }
        
       
    }
    
    fileprivate func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        minimumFontSize = 12
        adjustsFontSizeToFitWidth = true
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
        
    }
}
