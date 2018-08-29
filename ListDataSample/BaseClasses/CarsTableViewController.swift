//
//  CarsTableViewController.swift
//  ListDataSample
//
//  Created by ashish nakoti on 8/28/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import UIKit

// enum defining cell type.
enum CellType:String {
    
    case cell_local =  "listCars1"// Loading images for tab1
    case cell_web = "listCars2"   // Loadin images from tab2
}

class CarsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var carsData = [carListDataModel]()
    var cellIdentifier = String()
    let animationDuration = 0.5
    var cellType = CellType.cell_local
    
    // View lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCars()
    }
    
    // Loading all cars from Cars file.
    // Currently app reads data from Data.json file and parsing it accordingly to load it on array.
    func getAllCars(){
        let reqObj = Cars()
        reqObj.getCarsList(completion: { (response, error, success) in
            if success {
                self.carsData = ((response as? carsResponeModel)?.carsArray)!
            }
        })
    }
    
    // MARK: - Table view data source
    
    // Returning number of sections visible on tableview/listview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsData.count
    }
    
    // creating and returning cell based on it's type.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! ListCarsTableViewCell
        
        let carObj = self.carsData[indexPath.row]
        cell.listCar_Title.text = carObj.model
        cell.listCar_description.text = carObj.wiki
        cell.listCar_ImageV.image = UIImage.init(named: carObj.img!)
        return cell
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
