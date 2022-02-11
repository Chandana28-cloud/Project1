//
//  DataCell.swift
//  Project1
//
//  Created by Ravipati Lakshmi Sai Chandana on 11/02/22.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var Id: UILabel!
    @IBOutlet weak var Body: UILabel!
    @IBOutlet weak var Title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
