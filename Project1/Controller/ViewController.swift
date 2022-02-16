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
    var sections = [Section]()
    var sectionTitle = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r", "s","t","u","v","w","x","y","z"]
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
            let groupedDictionary = Dictionary(grouping: tableData!, by: {String($0.name.prefix(1))})
          //  let keys = groupedDictionary.keys.sorted()
            let nulvalue = [Data1]()
        sections = sectionTitle.map{ Section(letter: $0, names: groupedDictionary[$0.uppercased()] ?? nulvalue)}
        
            self.tableView.reloadData()
    }
    
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Header \(sections[section].letter)"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
       return "Footer \(sections[section].letter)"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map{$0.letter}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"ReusableIdentifier", for: indexPath) as! DataCell
        let section = sections[indexPath.section]
        cell.Id.text = String(section.names[indexPath.row].id)
        cell.Title.text = section.names[indexPath.row].name
        cell.Body.text = section.names[indexPath.row].email
        return cell

    }
    
}

