import UIKit

class ListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelectionDuringEditing = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath) as! ListTableViewCell
        cell.mainLabel.text = arrayItems[indexPath.row]["name"] as? String

        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let now = df.string(from: arrayItems[indexPath.row]["date"] as! Date)
        cell.seconLabel.text = now

        let isDone = arrayItems[indexPath.row]["isDone"] as! Bool
        if isDone {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell as UITableViewCell
    }
    
    @IBAction func addItemButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Новая задача", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Название"
        }
        let addAlert = UIAlertAction(title: "Добавить", style: UIAlertActionStyle.default) { (alert) in
            if alertController.textFields![0].text! != "" {
                let newDict = ["name": alertController.textFields![0].text!, "isDone": false, "date": Date(), "color": "white"] as [String : Any]
                arrayItems.append(newDict)
                self.tableView.reloadData()
            }
        }
        let cancelAlert = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default) { (alert) in
            
        }
        alertController.addAction(cancelAlert)
        alertController.addAction(addAlert)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editItemButtonPressed(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let cell = tableView.cellForRow(at: indexPath)
        if !tableView.isEditing {
            let isDone = arrayItems[indexPath.row]["isDone"] as! Bool
            if isDone {
                cell?.accessoryType = .none
                arrayItems[indexPath.row]["isDone"] = false
            } else {
                cell?.accessoryType = .checkmark
                arrayItems[indexPath.row]["isDone"] = true
            }
        } else {
            let alertController = UIAlertController(title: "Редактирование задачи", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addTextField { (textField) in
                textField.placeholder = "Название"
                textField.text = arrayItems[indexPath.row]["name"] as? String
            }
            let editAlert = UIAlertAction(title: "Изменить", style: UIAlertActionStyle.default) { (alert) in
                if alertController.textFields![0].text! != "" {
                    arrayItems[indexPath.row]["name"] = alertController.textFields![0].text!
                    tableView.reloadData()
                }
            }

            let cancelAlert = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default) { (alert) in }
            alertController.addAction(cancelAlert)
            alertController.addAction(editAlert)
            present(alertController, animated: true, completion: nil)
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let fromItem = arrayItems[fromIndexPath.row]
        arrayItems.remove(at: fromIndexPath.row)
        arrayItems.insert(fromItem, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
