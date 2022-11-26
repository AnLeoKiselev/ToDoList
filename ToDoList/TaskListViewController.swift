//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 18.11.2022.
//

import UIKit

class TaskListViewController: UIViewController {
    
    private let users = ["Boris", "Anatoliy", "Islam", "Gennadiy", "Marina", "Faina", "Nadezhda"]
    
    private lazy var taskListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task List"
        addToSubview()
        addConstraints()
    }
    
    private func addToSubview() {
        view.addSubview(taskListTableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            taskListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            taskListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TaskListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        cell.textLabel?.text = users[indexPath.row]
        
        return cell
    }
}
    // про табл UITableViewCell - создать массив задач магаз... в станд ячейку перенести - заголовок и описание - навернуть все что есть  - закруглиь, дизайн таблицы ...
