//
//  GFHeaderViewController.swift
//  ToDoMate
//
//  Created by guncel on 4.02.2024.
//

import UIKit

class GFHeaderViewController: UIView {

    let mainTitle = GFTitleLabel(textAlignment: .center, fontSize: 50,color: .white,text: "ToDoMate")
    let secondaryTitle = GFSubtitleLabel(textAlignment:.center,fontSize: 30, color: .white, text: "Get Things Done")
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func configure(){
        backgroundColor = .systemPink
        addSubview(mainTitle)
        mainTitle.layer.zPosition = 100
        addSubview(secondaryTitle)
        NSLayoutConstraint.activate([
            mainTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainTitle.heightAnchor.constraint(equalToConstant: 55),
           
            secondaryTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            secondaryTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 40),
            secondaryTitle.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

}
