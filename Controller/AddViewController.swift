//
//  AddViewController.swift
//  LULULemonAssessment
//
//  Created by Rick Martinez on 6/8/22.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        createNewGarment()
        self.dismiss(animated: true)
    }
    
    private func createNewGarment() {
        guard textField.hasText else { return }
        
        let newGarment = Garment(context: Constants.context)
        newGarment.name = textField.text
        newGarment.creationDate = Date()
        
        Constants.save()
    }
}


