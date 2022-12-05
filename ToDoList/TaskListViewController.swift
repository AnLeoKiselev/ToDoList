//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 18.11.2022.
// https://www.youtube.com/watch?v=Pu7B7uEzP18

import UIKit
import SwiftUI

class TaskListViewController: UIViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["All", "To Do", "Done"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentTintColor = .white
        control.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(segmentedControlDidChange(_:)), for:.valueChanged)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    
    private lazy var taskListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.backgroundColor = .clear //прозрачный цвет
        tableView.layer.cornerRadius = 10
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task List"
        view.backgroundColor = #colorLiteral(red: 0.1097827628, green: 0.1051032469, blue: 0.1424088478, alpha: 1)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        addToSubview()
        addConstraints()
        configureItems()
    }
    
    @objc func segmentedControlDidChange(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print ("0")
            taskListTableView.reloadData()
        case 1:
            print ("1")
        case 2:
            print ("2")
        default:
            print ("All")
        }
    }
    
    private func configureItems() {
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Avenir Next Bold", size: 20.0)!]
        
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(openTaskViewController))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOutButtonTapped))
    }

    private func addToSubview() {
        view.addSubview(taskListTableView)
        view.addSubview(segmentedControl)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            taskListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            taskListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            taskListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            taskListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func reloadData() {
        //taskListTableView.reloadData()
        
        if self.viewIfLoaded?.window != nil {
            print ("виден")
        }
        
        taskListTableView.backgroundColor = .red
        //taskListTableView.reloadData()
        print ("привкте")
        //taskListTableView.backgroundColor = .systemMint
    }
    
}

extension TaskListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LocalStore.shared.taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(mainLabelText: LocalStore.shared.taskArray[indexPath.row].mainname, descriptionLabelText: //LocalStore.shared.taskArray[indexPath.row].descriptionName, imageName: "checkmark.square.fill 2")
        LocalStore.shared.taskArray[indexPath.row].descriptionName, imageName: "checkmark.square 2")
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addTaskEditorViewController = TaskEditorViewController()  //нажат ряд
        navigationController?.pushViewController(addTaskEditorViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //высота ячейки
    }
    
    @objc func openTaskViewController() {
        //let openNewTaskViewController = AddNewTaskViewController()
       // navigationController?.pushViewController(openNewTaskViewController, animated: true)
        let openNewTaskViewController = AddNewTaskViewController()
//        navigationController?.modalPresentationStyle = .pageSheet
//
        present(openNewTaskViewController, animated: true)  //present - показали и убрали
    }
    
//    openTaskViewController() {
//        let openNewTaskViewController = AddNewTaskViewController()
//        navigationController?.pushViewController(openNewTaskViewController, animated: true)
//    }
    
    
    
    @objc func logOutButtonTapped() {
        
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
    
