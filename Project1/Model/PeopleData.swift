//
//  PeopleData.swift
//  Project1
//
//  Created by Ravipati Lakshmi Sai Chandana on 11/02/22.
//

import Foundation

struct PeopleData: Decodable {
    
    let data: [Data1]
}
struct Data1: Decodable {
    
    let id: Int
    let name: String
    let email: String
}

struct Section {
    
    let letter: String
    let names: [Data1]
}

