//
//  ViewController.swift
//  LULULemonAssessment
//
//  Created by Rick Martinez on 6/8/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var garmentArray: [Garment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchGarments()
        segmentControl.addTarget(self, action: #selector(sortGarments), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchGarments()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "addVCSegue", sender: nil)
    }
    
    private func fetchGarments() {
        let request: NSFetchRequest<Garment> = Garment.fetchRequest()
        
        do {
            garmentArray = try Constants.context.fetch(request)
        }
        catch {
            debugPrint(error.localizedDescription)
        }
        
        sortGarments()
    }
    
    @objc func sortGarments() {
        if segmentControl.selectedSegmentIndex == 0 {
            garmentArray = garmentArray.sorted { $0.name! < $1.name! }
        } else {
            garmentArray = garmentArray.sorted { $0.creationDate! < $1.creationDate! }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garmentArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "garmentCell", for: indexPath) as? GarmentCell {
            cell.configureCell(for: garmentArray[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}



