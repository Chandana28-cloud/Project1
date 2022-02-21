//
//  ViewController.swift
//  Project1
//
//  Created by Ravipati Lakshmi Sai Chandana on 11/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UpdateTheData {
   
    @IBOutlet weak var tableView: UITableView!
    var datamanager = dataManaging()
    var sectionController = SectionController()
    var tableData: [Data1]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //  Do any additional setup after loading the view
        datamanager.delegate = self
        datamanager.fetchData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "ReusableIdentifier")
        let headerView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: self.tableView.frame.width,
                                              height: 50))
        headerView.backgroundColor = .green
        self.tableView.tableHeaderView = headerView
        let footerView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: self.tableView.frame.width,
                                              height: 50))
        footerView.backgroundColor = .green
        self.tableView.tableFooterView = footerView

    }
    
    func updateData(_ peopleManaging: dataManaging, datareq1: [Data1]) {

        tableData = datareq1
        sectionController.updateTheDataIntoSection(tableData: tableData!)
        self.tableView.reloadData()
    }
    
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header \(sectionController.sections[section].letter)"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer \(sectionController.sections[section].letter)"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionController.sections.count
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionController.sections.map{$0.letter}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionController.sections[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableIdentifier", for: indexPath) as! DataCell
        let section = sectionController.sections[indexPath.section]
        cell.Id.text = String(section.names[indexPath.row].id)
        cell.Title.text = section.names[indexPath.row].name
        cell.Body.text = section.names[indexPath.row].email
        return cell
    }
}

