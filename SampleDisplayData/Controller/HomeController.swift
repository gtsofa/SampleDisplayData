//
//  HomeController.swift
//  SampleDisplayData
//
//  Created by Julius on 13/08/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    //MARK: - Properties
    //TODOs: button to navigate
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(toTheNextScreen), for: .touchUpInside)
        
        return button
        
    }()
    private let editDeleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit | Delete", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(editDeleteScreen), for: .touchUpInside)
        
        return button
        
    }()
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        navigationItem.title = "Home Screen"
        
        //constraint
        view.addSubview(nextButton)
        nextButton.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 90, paddingLeft: 16, paddingRight: 16)
        view.addSubview(editDeleteButton)
        editDeleteButton.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 120, paddingLeft: 16, paddingRight: 16)
    }
    
    //MARK: - Handlers
    @objc func toTheNextScreen()
    {
        print("lets go to the next screen")
        let controller = ShowDataController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func editDeleteScreen()
    {
        print("lets go to the next screen")
        let controller = EditDeleteController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
