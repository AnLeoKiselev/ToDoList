//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 18.11.2022.
// https://www.youtube.com/watch?v=Pu7B7uEzP18

import UIKit

class TaskListViewController: UIViewController {
    
//    private lazy var backGroundImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "background2")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    } ()
    
    private let users = ["Boris", "Anatoliy", "Islam", "Gennadiy", "Marina", "Faina", "Nadezhda"]
    
    private lazy var taskListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        //tableView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        tableView.backgroundColor = .clear //прозрачный цвет
        tableView.layer.cornerRadius = 10
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task List"
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        addToSubview()
        addConstraints()
    }
    
    private func addToSubview() {
        //view.addSubview(backGroundImageView)
        view.addSubview(taskListTableView)
    }
    
    private func addConstraints() {
        
        //backGroundImageView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            taskListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            taskListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            taskListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            taskListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(text: users[indexPath.row], imageName: "checkmark")
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //высота ячейки
    }
}
    // про табл UITableViewCell - создать массив задач магаз... в станд ячейку перенести - заголовок и описание - навернуть все что есть  - закруглиь, дизайн таблицы ...
