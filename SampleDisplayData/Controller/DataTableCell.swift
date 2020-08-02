//
//  DataTableCell.swift
//  SampleDisplayData
//
//  Created by Julius on 02/08/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class DataTableCell: UITableViewCell {
    let cellView: UIView = {
        let view = UIView()
        //view.backgroundColor = .red
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //label
    
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        //label.text = "Day 1"
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let saveAccountLabel: UILabel = {
        let label = UILabel()
        //label.text = "Day 1"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let saveDatetLabel: UILabel = {
        let label = UILabel()
        //label.text = "2020-07-26 17:15"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let saveAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "USD 2"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let receiveLabel: UILabel = {
        let label = UILabel()
        label.text = "KES 510"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "KES 510"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //image
    private let loginImage: UIImageView = {
        let saveImageView = UIImageView()
        saveImageView.image = UIImage(named: "mobile_trans")
        saveImageView.translatesAutoresizingMaskIntoConstraints = false
        return saveImageView
        
    }()
    
    var singleData: SampleData! {
        didSet {
            let nome = "Mobile"
            
            userNameLabel.text = singleData.username
            //saveAccountLabel.text = singleData.saveAccount
            //saveAccountLabel.text = singleData?.accountType ?
            saveAmountLabel.text = singleData.saveAmount
            saveDatetLabel.text = singleData.saveDate
            accountTypeLabel.text = nome
            //accountTypeLabel.text = singleData.accountType
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //new
        addSubview(cellView)//1st container
        cellView.addSubview(userNameLabel)//2nd instead container
        cellView.addSubview(saveDatetLabel)//contact
        cellView.addSubview(saveAmountLabel)//send
        cellView.addSubview(accountTypeLabel)//receive
        //cellView.addSubview(editButton)
        cellView.addSubview(loginImage)//profile image
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        //name constraint
        userNameLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -20).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 70).isActive = true
        
        //contact constraint
        saveDatetLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        saveDatetLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        saveDatetLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 10).isActive = true
        saveDatetLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 70).isActive = true
        //send constraint
        saveAmountLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        saveAmountLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        saveAmountLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -20).isActive = true
        saveAmountLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 280).isActive = true
        //receive constraint
        accountTypeLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        accountTypeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        accountTypeLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 10).isActive = true
        accountTypeLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 280).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
