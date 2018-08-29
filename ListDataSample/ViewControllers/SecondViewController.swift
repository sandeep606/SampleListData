//
//  SecondViewController.swift
//  ListDataSample
//
//  Created by ashish nakoti on 8/28/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: CarsTableViewController {

    //var carsData = [carListDataModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = super.self()
        tableView.delegate = super.self()
        cellType = .cell_web
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
}

