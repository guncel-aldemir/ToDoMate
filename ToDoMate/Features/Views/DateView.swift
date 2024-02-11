//
//  DateViewViewController.swift
//  ToDoMate
//
//  Created by guncel on 10.02.2024.
//

import UIKit

class DateView: UIViewController {

    
    let dateTitle = GFTitleLabel(textAlignment: .center, fontSize: 18, color: .label, text:"Label")
    let nextButton = GFButton(backgroundColor: .systemBlue, title: ">")
    let backButton = GFButton(backgroundColor: .systemBlue, title: "<")
    var dayNameLabels : [GFSubtitleLabel] = []
    let collectionView = GFCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout(), scrollDirection: .horizontal, cell: DateCollectionViewCell.self, identifier: DateCollectionViewCell.identifier)
    var selectedDate = Date()
    var totalSquare = [Date]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDateAndCross()
        setWeekView()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func setWeekView(){
        totalSquare.removeAll()
        var current = CalendarHelper().sundayForDate(date: selectedDate)
                let nextSunday = CalendarHelper().addDays(date: current, days: 7)
                
                while (current < nextSunday)
                {
                    totalSquare.append(current)
                    current = CalendarHelper().addDays(date: current, days: 1)
                }
                
        dateTitle.text = CalendarHelper().monthString(date: selectedDate) + "." + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
    }
    func configureDateAndCross(){
     let dayNames = ["Mon","Tue","Wed","Thur","Fri","Sat","Sun"]
        for dayName in dayNames {
            let dayNameLabel = GFSubtitleLabel(textAlignment: .center, fontSize: 14, color: .secondaryLabel, text: dayName)
            dayNameLabels.append(dayNameLabel)
        }
        let stackDays = UIStackView(arrangedSubviews: dayNameLabels)
        stackDays.distribution = .fillEqually
        
        view.addSubview(stackDays)
        
        stackDays.translatesAutoresizingMaskIntoConstraints = false
        
        let stackUpper = UIStackView(arrangedSubviews: [backButton, dateTitle, nextButton])
        stackUpper.distribution = .fillEqually
        stackUpper.alignment = .center
        
        view.addSubview(stackUpper)
        
        stackUpper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackUpper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackUpper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackUpper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackUpper.heightAnchor.constraint(equalToConstant: 60),
            
            stackDays.topAnchor.constraint(equalTo: stackUpper.bottomAnchor, constant: Paddings.paddingTP),
            stackDays.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackDays.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackDays.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackDays.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        nextButton.addTarget(self, action: #selector(nextWeekAction), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(prevWeekAction), for: .touchUpInside)
    }
    @objc func nextWeekAction(){
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    @objc func prevWeekAction(){
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
}
extension DateView:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquare.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionViewCell.identifier, for: indexPath) as! DateCollectionViewCell
        
        let date = totalSquare[indexPath.item]
        cell.dayNumLabel.text = String(CalendarHelper().dayOfMonth(date: date))
        
        if (date == selectedDate){
            cell.backgroundColor = .systemGreen
            print(selectedDate)
        }else{
            cell.backgroundColor = .systemBackground
        }
       
      return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquare[indexPath.item]
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.size.width - 2) / 8
        let height = (view.frame.size.height - 2)
        
        return   CGSize(width: width, height: height)
       
    }
    
}
