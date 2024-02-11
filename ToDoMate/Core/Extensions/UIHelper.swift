//
//  UIHelper.swift
//  ToDoMate
//
//  Created by guncel on 10.02.2024.
//


import UIKit


enum UIHelper{
    static func createCalendarFlowlayout(in view: UICollectionView) -> UICollectionViewFlowLayout{
        let width = (view.frame.size.width - 2) / 8
        let height = (view.frame.size.height - 2) / 8
        
        let flowlayout = view.collectionViewLayout as! UICollectionViewFlowLayout
        flowlayout.itemSize = CGSize(width: width, height: height)
         return flowlayout
    }
}
