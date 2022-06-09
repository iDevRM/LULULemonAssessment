//
//  GarmentCell.swift
//  LULULemonAssessment
//
//  Created by Rick Martinez on 6/8/22.
//

import Foundation
import UIKit

class GarmentCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureCell(for garment: Garment) {
        if let name = garment.name {
            nameLabel.text = name
        }
    }
    
}
