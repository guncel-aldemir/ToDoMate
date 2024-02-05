//
//  Constants.swift
//  ToDoMate
//
//  Created by guncel on 5.02.2024.
//

import UIKit

enum Paddings {
    static let paddingTP:CGFloat = 20
    static let paddingLR:CGFloat = 50
    static let paddingButton:CGFloat = 100
   
    
}
enum Heights {
    static let registerButtonHeight:CGFloat = 50
    static let loginButtonHeight: CGFloat = 40
    static let headerViewHeight:CGFloat = 300
    static let staticLabelHeight:CGFloat = 20
    static let createLabelHeight:CGFloat = 20
}

enum Register {
    static let capitalLetterRegEx: String  = "[A-Z]+"
    static let numberRegEx:String  = "[0-9]+"
    static let specialCharacterRegEx: String  = "[.*&^%$#@()/]+"
}
