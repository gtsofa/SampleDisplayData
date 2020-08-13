//
//  EditDeleteController.swift
//  SampleDisplayData
//
//  Created by Julius on 13/08/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

//structure of data
struct DataStructure {
    let beneficiaryName: String
    let availableData: String
    let isBankBeneficiary: Bool
    let benType: String//bank/mobile
    let benImage: String
    
}

class EditDeleteController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditDeleteCellDelegate  {
    
    //MARK: - Properties
    let getIncomingData = "Big Ben#254702326633#No acc_name#0#mobile#156&Blue Monkey#2540755939021#No acc_name#0#mobile#158&Sea Horse#254745555580#No acc_name#0#mobile#159&Lazy Frog#254766775530#No acc_name#0#mobile#160&John Doe#2547212121230#No acc_name#0#mobile#161&Emery Jane#2540737708845#No acc_name#0#mobile#162&Louisa Amaco#Cooperative Bank#Jeniffer Lopez#3570000000023#bank#163&Anna Forza#Bank of Coders#Big Smalls#11450000000045#bank#164&John Doe#2540723450000#No acc_name#0#mobile#165&Paul Wales#25407290000675#No acc_name#0#mobile#166&Shosh Grand#2540723404060#No acc_name#0#mobile#175"
    fileprivate let cellId = "beneficiaryCell"
    let dataTableView = UITableView() // view
    var newDataArray = [DataStructure]()
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Edit Delete"
        attemptToGroupBeneficiaries()
        
        //attemptToGroupBeneficiaries()
        dataTableView.dataSource = self
        dataTableView.delegate = self
        view.addSubview(dataTableView)
        dataTableView.register(EditDeleteTableCell.self, forCellReuseIdentifier: cellId)
        dataTableView.separatorStyle = .none//remove default line separator
        dataTableView.backgroundColor = .darkGray
        
        
        
        //constraints
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        
        dataTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        dataTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    //MARK: - Handlers
    fileprivate func attemptToGroupBeneficiaries()
    {
        
        let incomingSampleData = getIncomingData
        let cleanData = incomingSampleData.split(separator: "&")
        var outerBeneficiariesArray = [DataStructure]()
        
        for(index, element) in cleanData.enumerated()
        {
            let beneficiariesData = element.split(separator: "#")
            let benName = beneficiariesData[0]
            let dataAvailable = beneficiariesData[1]
            let beneficiaryType = beneficiariesData[4]
            
            var image = ""
            let isBankBeneficiary: Bool
            
            if beneficiaryType == "bank"
            {
                isBankBeneficiary = true
                image = "bank_trans"
            }
            else
            {
                isBankBeneficiary = false
                image = "mobile_trans"
            }
            
            outerBeneficiariesArray.append((DataStructure(beneficiaryName: String(benName), availableData: String(dataAvailable), isBankBeneficiary: isBankBeneficiary, benType: String(beneficiaryType), benImage: image)))
            
            
        }
        
        let groupedBeneficiaries = Dictionary(grouping: outerBeneficiariesArray) { (element) -> String in
            return element.beneficiaryName
        }
        //loop throug a dict
        groupedBeneficiaries.keys.forEach {(key) in
            let values = groupedBeneficiaries[key]
            print(values ?? "")
            
            //append here
            newDataArray.append(contentsOf: values ?? [])// add it here
    
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         return true
     }

     
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
         
         let oneBeneficiary = newDataArray[indexPath.row]

         let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
             //TODO: edit the row at indexPath here
             self.updateAction(oneBeneficiary: oneBeneficiary, indexPath: indexPath)//item to update, its indexpath
             
         }
         editAction.backgroundColor = .blue

         let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
             //TODO: Delete the row at indexPath here
             print("item: \(oneBeneficiary)")
             print("delete button tapped: \(self.newDataArray[indexPath.row])")
             self.deleteAction(oneBeneficiary: oneBeneficiary, indexPath: indexPath)//item to delete, it's parth
         }
         deleteAction.backgroundColor = .red

         return [editAction,deleteAction]
     }
     //Edit
     private func updateAction(oneBeneficiary: DataStructure, indexPath: IndexPath) {
         let alert = UIAlertController(title: "EDIT BENEFICIARY", message: "Are you sure you want to edit \(oneBeneficiary.beneficiaryName) ?", preferredStyle: UIAlertController.Style.alert)
         let saveAction = UIAlertAction(title: "Save", style: .default) {(action) in
             guard let textField = alert.textFields?.first else {return}
             /*var lastName = self.lnameTextField.text
             lastName = oneBeneficiary.beneficiaryName
             guard let mobileNumber = self.mobileTextField.text else {return}
             print("last name: \(lastName)")*/
             

         }
         
         /*if let textToEdit = oneBeneficiary.beneficiaryName {
             if textToEdit.count == 0 {
                 return
             }
             oneBeneficiary.beneficiaryName = textToEdit
             self.benficiariesTableView.deleteRows(at: [indexPath], with: .automatic)
         }else
         {
             return
         }*/
         //oneBeneficiary.beneficiaryName = textField
         
         let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
         alert.addTextField()
         guard let textField = alert.textFields?.first else {return}
         //guard let mobileNumber = self.mobileTextField.text else {return}
         textField.placeholder = oneBeneficiary.beneficiaryName
         alert.addAction(saveAction)
         alert.addAction(cancelAction)
         present(alert, animated: true)
     }
     
     
     
     //Delete
     private func deleteAction(oneBeneficiary: DataStructure, indexPath: IndexPath)
     {
         let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete \(oneBeneficiary.beneficiaryName.uppercased()) ? ", preferredStyle: .alert)
         let deleteAction = UIAlertAction(title: "Yes", style: .default) {(action) in
             self.newDataArray.remove(at: indexPath.row)
             self.dataTableView.deleteRows(at: [indexPath], with: .automatic)
         }
         //cancel
         let cancelAction = UIAlertAction(title: "NO", style: .default, handler: nil)
         alert.addAction(deleteAction)
         alert.addAction(cancelAction)
         present(alert, animated: true)
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return newDataArray.count
        }
     
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EditDeleteTableCell
         let singleBeneficiary: DataStructure = newDataArray[indexPath.row]
         cell.singleBeneficiary = singleBeneficiary
         //provide teh delegate
         cell.delegate = self
         cell.index = indexPath
         cell.myViewBeneficiaryController = self
         return cell
     }
     
     
     func sendMoneyScreen(cell: UITableViewCell)
     {
         /*let controller = SendMoneyController()
         navigationController?.pushViewController(controller, animated: true)*/
         
     }
     
     func delete_beneficiary(cell: UITableViewCell)
     {
         print("delete!")
         print("tapped cell: \(cell)")
         //indexpath.row
         
         deleteBeneficiary(index: 4)
         let alert = UIAlertController(title: "Delete Beneficiary", message: "Are you sure you want to delete this beneficiary?", preferredStyle: .alert)
         
         let deleteAction = UIAlertAction(title: "YES", style: .default) {(action) in
             if let deletionIndexPath = self.dataTableView.indexPath(for: cell) {
                 self.newDataArray.remove(at: deletionIndexPath.row)
                 self.dataTableView.deleteRows(at: [deletionIndexPath], with: .automatic)
             }
         }
         //cancel
         let cancelAction = UIAlertAction(title: "CANCEL", style: .default, handler: nil)
         alert.addAction(deleteAction)
         alert.addAction(cancelAction)
         present(alert, animated: true)
         
         
         
     }
     
     func edit_mobile_beneficiary()
     {
         print("edit mobile")
     }
     
     func deleteBeneficiary(index: Int) {
         print("\(index) is clicked")
         let benName = "\(newDataArray[index].beneficiaryName)"
         //let benID = "\(newBeneficiariesArray[index].beneficiaryID)"
         //print("Name: \(benName) ==ID: \(benID)")
     }
     
     func editBeneficiary(index: Int) {
         print("TODO: edit beneficiary")
     }
     
     func sendMoneyBeneficiary(index: Int) {
         print("TODO: sendMoney beneficiary")
     }
}
