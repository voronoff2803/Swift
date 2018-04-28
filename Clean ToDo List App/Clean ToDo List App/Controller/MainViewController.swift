//
//  ViewController.swift
//  Clean ToDo List App
//
//  Created by Alexey Voronov on 28.04.2018.
//  Copyright © 2018 Alexey Voronov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let headerTitles = ["Active", "Complited"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

