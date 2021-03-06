//
//  dataManaging.swift
//  Project1
//
//  Created by Ravipati Lakshmi Sai Chandana on 11/02/22.
//

import Foundation

protocol UpdateTheData {
    func updateData(_ peopleManaging: dataManaging, datareq1: [PeopleData])
    
}

struct dataManaging {
    
    let peopleurl = "https://gorest.co.in/public/v2/posts"
    var delegate: UpdateTheData?
    
    func fetchData() {
            if let url = URL(string: peopleurl) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(" This is the error \(error!)")
                        return
                    }
                    if let safeData = data {
                        print("the data is \(safeData)")
                        self.parsing(safeData)
                    }
                }
                task.resume()
            }
    }
    
    func parsing(_ peopleJsonData : Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([PeopleData].self, from: peopleJsonData)
            let datareq = decodedData
 
            DispatchQueue.main.async {
            self.delegate?.updateData(self, datareq1: datareq)
            }
        }
        catch {
            print("The error is \(error) ")
        }
    }
}
