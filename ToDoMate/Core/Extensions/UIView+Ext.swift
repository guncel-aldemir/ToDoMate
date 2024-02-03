//
//  UIView+Ext.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit

extension UIView{
    func addSubviews(_ views:UIView...){
        for view in views {
            addSubview(view)
        }
    }
}
