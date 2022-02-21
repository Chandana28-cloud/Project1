//
//  ModelController.swift
//  Project1
//
//  Created by Ravipati Lakshmi Sai Chandana on 17/02/22.
//

import Foundation

class SectionController {
    
    var sections = [Section]()
    var sectionTitle = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r", "s","t","u","v","w","x","y","z"]
    
    func updateTheDataIntoSection(tableData: [Data1]) {
        
        let groupedDictionary = Dictionary(grouping: tableData, by: {String($0.name.prefix(1))})
        let nulvalue = [Data1]()
        sections = sectionTitle.map{ Section(letter: $0, names: (groupedDictionary[$0.uppercased()] ?? nulvalue).sorted(by: { $0.name < $1.name }))}
    }
}
