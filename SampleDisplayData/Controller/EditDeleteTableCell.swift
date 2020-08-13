//
//  EditDeleteTableCell.swift
//  SampleDisplayData
//
//  Created by Julius on 13/08/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit
//protocol
protocol EditDeleteCellDelegate: AnyObject {
    func deleteBeneficiary(index: Int)
    func editBeneficiary(index: Int)
    func sendMoneyBeneficiary(index: Int)
}

class EditDeleteTableCell: UITableViewCell {
    
    weak var delegate : EditDeleteCellDelegate?
    var index: IndexPath?
    
    var myViewBeneficiaryController: EditDeleteController?
    
    //view
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let beneficiaryNameLabel: UILabel = {
        let label = UILabel()
        //label.text = "Julius Tsofa"
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let contactLabel: UILabel = {
        let label = UILabel()
        label.text = "0726235055"
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editButton: UIButton = {
        let button = UIButton(type: .custom)
        //let checkbox = UIButton.init(type: .custom)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Edit", for: .normal)
        //button.titleLabel?.font = UIFont(name: "San Francisco", size: 10)
        button.titleLabel!.font =  UIFont(name: "HelveticaNeue-Thin", size: 15)
        let icon = UIImage(named: "edit_button")
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        
        //button.backgroundColor = .mainAmber
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        //button.addTarget(self, action: #selector(editBeneficiary), for: .touchUpInside)
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .custom)
        //let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Delete", for: .normal)
        //let icon = UIImage(named: "delete_beneficiary")!
        button.titleLabel!.font =  UIFont(name: "HelveticaNeue-Thin", size: 15)
        //button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        
        //button.backgroundColor = .mainAmber
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return button
    }()
    
    let sendMoneyButton: UIButton = {
        let button = UIButton(type: .custom)
        //let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Send Money", for: .normal)
        //let icon = UIImage(named: "send_button")!
        button.titleLabel!.font =  UIFont(name: "HelveticaNeue-Thin", size: 15)
        //button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 140).isActive = true
        //button.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
        
        return button
    }()
    
    //image
    private let beneficiaryProfileImage: UIImageView = {
        let saveImageView = UIImageView()
        saveImageView.image = UIImage(named: "mobile_trans")
        saveImageView.translatesAutoresizingMaskIntoConstraints = false

        return saveImageView
        
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    
    
    
    var singleBeneficiary: DataStructure! {
        didSet {
        
            beneficiaryProfileImage.image = singleBeneficiary.isBankBeneficiary ? UIImage(named: "bank_trans") : UIImage(named: "mobile_trans")
            
            beneficiaryNameLabel.text = singleBeneficiary.beneficiaryName
            beneficiaryNameLabel.textColor = singleBeneficiary.isBankBeneficiary ? .orange : .green
            contactLabel.text = singleBeneficiary.availableData
            contactLabel.textColor = singleBeneficiary.isBankBeneficiary ? .orange : .green
            
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear//separates the different cells..magic!
        
        //container
        addSubview(cellView)
        cellView.addSubview(editButton)
        cellView.addSubview(beneficiaryProfileImage)
        cellView.addSubview(beneficiaryNameLabel)
        cellView.addSubview(editButton)
        cellView.addSubview(contactLabel)
        cellView.addSubview(deleteButton)
        cellView.addSubview(sendMoneyButton)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        beneficiaryProfileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beneficiaryProfileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        beneficiaryProfileImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -10).isActive = true
        beneficiaryProfileImage.leftAnchor.constraint(equalTo: cellView.leftAnchor).isActive = true
        beneficiaryNameLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        beneficiaryNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        beneficiaryNameLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -20).isActive = true
        beneficiaryNameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 50).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        editButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 20).isActive = true
        editButton.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        contactLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        contactLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        contactLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -20).isActive = true
        contactLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 210).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 20).isActive = true
        deleteButton.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 100).isActive = true//100
        sendMoneyButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sendMoneyButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sendMoneyButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 20).isActive = true
        sendMoneyButton.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 220).isActive = true
        
        // put the methods here
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
