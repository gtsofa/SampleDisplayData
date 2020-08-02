//
//  ShowDataController.swift
//  SampleDisplayData
//
//  Created by Julius on 02/08/2020.
//  Copyright © 2020 Julius. All rights reserved.
//

import UIKit

struct SampleData {
    let username: String
    let saveAccount: String
    let saveAmount: String
    let saveDate:String
    let accountType: String
    
}

class ShowDataController: UITableViewController {
    //MARK: - Properties
    fileprivate let cellId = "sampleCell"
    
    let sampleArray = [SampleData(username: "Jac Bauer", saveAccount: "4100000000", saveAmount: "USD 5", saveDate: "2020-07-23 22:07:47", accountType: "bank"),
                       SampleData(username: "John Doe", saveAccount: "245722222222", saveAmount: "USD 20", saveDate: "2020-07-23 22:08:58", accountType: "mobile"),
    SampleData(username: "Sara Maya", saveAccount: "4200000000", saveAmount: "USD 12", saveDate: "2020-07-25 22:08:58", accountType: "bank"),
    SampleData(username: "Piet Pompies", saveAccount: "245745228888", saveAmount: "USD 15", saveDate: "2020-07-24 22:08:58", accountType: "mobile")]
    
    var newsampleDataArray = [SampleData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        navigationItem.title = "Sample Data"
        tableView.register(DataTableCell.self, forCellReuseIdentifier: cellId)
        attemptToGroupData()
    }
    
    //group data to
    fileprivate func attemptToGroupData()
    {
        print("I am trying to group these messages together!!")
        
        let groupedData = Dictionary(grouping: sampleArray) { (element) -> String in
            return element.saveDate
        }
        //loop throug a dict
        groupedData.keys.forEach {(key) in
            print("here is the key: \(key)")
            let values = groupedData[key]
            //print("values: \(values ?? " ")")
            print(values ?? "")
            
            //append here
            newsampleDataArray.append(contentsOf: values ?? [])
            print("All Transactions from server: \(newsampleDataArray)")
            
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Sample list"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let containerView = UIView()
        containerView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        return containerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return tuttoTransactions.count//10
        return newsampleDataArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DataTableCell
        
        let singleDataRow = newsampleDataArray[indexPath.row]
        cell.singleData = singleDataRow
        return cell
    }
}
