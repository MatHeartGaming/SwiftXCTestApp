//
//  ViewController.swift
//  SwiftTestingApp
//
//  Created by Matteo Buompastore on 08/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoList = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func addClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item", message: "Enter your to do item", preferredStyle: .alert)
        alert.addTextField{textField in
            textField.placeholder = "Enter item"
        }
        let okButton = UIAlertAction(title: "OK", style: .default) {action in
            guard let textField = alert.textFields?.first, let inputText = textField.text, !inputText.isEmpty else {
                return
            }
            
            self.todoList.insert(inputText, at: 0)
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
            
        }
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = todoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

