//
//  GFButton.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit

final class GFButton: UIButton {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(backgroundColor: UIColor, title:String){
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        
    }
    
    fileprivate func configure(){
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(backgroundColor:UIColor, title:String){
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    func click(targetOne:Any?,action:Selector,controlEvents:UIControl.Event){
        addTarget(targetOne, action: action, for: controlEvents)
    }
    
}
