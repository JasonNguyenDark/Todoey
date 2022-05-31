//
//  ViewController.swift
//  Todoey
//
//  Created by Jason Nguyen on 30/5/22.
//

import UIKit

class ToDoListViewController: UITableViewController {
    var itemArr = [Item]()
    
    let defaults = UserDefaults.standard

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Option 1", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //print(textField.text)
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArr.append(newItem)
            self.defaults.set(self.itemArr, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            //
            textField = alertTextField
            //print(alertTextField.text)
            //print("now")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem1 = Item()
        newItem1.title = "Option 1"
        itemArr.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Option 2"
        itemArr.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Option 3"
        itemArr.append(newItem3)
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArr = items
        }
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArr[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark: .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArr[indexPath.row])
        // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        itemArr[indexPath.row].done = !itemArr[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}
