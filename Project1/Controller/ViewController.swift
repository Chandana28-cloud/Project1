//
//  ViewController.swift
//  Project1
//
//  Created by Ravipati Lakshmi Sai Chandana on 11/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,  UpdateTheData {

    @IBOutlet weak var tableView: UITableView!
    var tableData: [Data1]?
    var datamanager = dataManaging()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        datamanager.delegate = self
        datamanager.fetchData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "ReusableIdentifier")

    }
    
    func updateData(_ peopleManaging: dataManaging, datareq1: [Data1]) {
            tableData = datareq1
            self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count1 = tableData?.count {
            return count1
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"ReusableIdentifier", for: indexPath) as! DataCell
        cell.Id.text = self.tableData?[indexPath.row].id
        cell.Title.text = self.tableData?[indexPath.row].title
        cell.Body.text = self.tableData?[indexPath.row].body
        return cell
    }
    
}

