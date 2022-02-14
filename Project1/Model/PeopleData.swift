//
//  PeopleData.swift
//  Project1
//
//  Created by Ravipati Lakshmi Sai Chandana on 11/02/22.
//

import Foundation

struct PeopleData: Decodable, Equatable {
    let id: Int
    let title: String
    let body: String
}
