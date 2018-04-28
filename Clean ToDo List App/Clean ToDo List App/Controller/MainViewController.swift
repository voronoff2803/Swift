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
    
    var items = [Item]()
    var completedItems: [Item] {
        return items.filter{$0.isCompleted}
    }
    var activeItems: [Item] {
        return items.filter{!$0.isCompleted}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append(contentsOf: [
            Item(name: "First thing", comments: "First thing comments", dueDate: Date()),
            Item(name: "Second thing", comments: "Second thing comments", dueDate: Date()),
            Item(name: "Third thing", comments: "Third thing comments", dueDate: Date())
            ])
        items[2].completionDate = Date()
    }
    
    func getItem(forIndexPath indexPath: IndexPath) -> Item {
        return (indexPath.section == 0) ? activeItems[indexPath.row] : completedItems[indexPath.row]
    }
}
    
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return activeItems.count
        case 1:
            return completedItems.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //Если стиль редактирования - удаление
        if editingStyle == .delete {
            //Получаем объект по пути
            let item = getItem(forIndexPath: indexPath)
            //Ищем объект в массиве и удаляем
            items.remove(at: items.index(where: {
                $0 == item
            })!)
            //Перезагружаем табличное представление
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let item = getItem(forIndexPath: indexPath)
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.dueDate)"
        
        return cell
    }
}

