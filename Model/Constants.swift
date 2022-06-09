//
//  Constants.swift
//  LULULemonAssessment
//
//  Created by Rick Martinez on 6/8/22.
//

import Foundation
import UIKit

struct Constants {
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func save() {
        do {
            try context.save()
        }
        catch {
            debugPrint(error.localizedDescription)
        }
    }
}
