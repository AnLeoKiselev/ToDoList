//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 18.11.2022.
// https://www.youtube.com/watch?v=Pu7B7uEzP18

import UIKit
import SwiftUI

class TaskListViewController: UIViewController {
    
    var segmentedControlPosition = ""
    
    private lazy var backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["All", "To Do", "Done"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.5654026866, green: 0.4771631956, blue: 0.8172003031, alpha: 1)
        segmentedControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange(_:)), for:.valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var taskListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.backgroundColor = .clear //прозрачный цвет
        tableView.layer.cornerRadius = 10
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task List"
        addToSubview()
        addConstraints()
        configureItems()
    }
    
    private func configureItems() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Avenir Next Bold", size: 20.0)!]
        
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(openTaskViewController))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOutButtonTapped))
    }
    
    private func addToSubview() {
        view.addSubview(backGroundImageView)
        view.addSubview(taskListTableView)
        view.addSubview(segmentedControl)
    }
    
    @objc func segmentedControlDidChange(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControlPosition = "All"
            taskListTableView.reloadData()
        case 1:
            segmentedControlPosition = "ToDo"
            taskListTableView.reloadData()
        case 2:
            segmentedControlPosition = "Done"
            taskListTableView.reloadData()
        default:
            segmentedControlPosition = "All"
        }
    }
    
    func reloadData() {
        taskListTableView.reloadData()
        taskListTableView.backgroundColor = .red
        print ("reloaded")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            taskListTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            taskListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            taskListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            taskListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
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
        
        if segmentedControlPosition == "All" {
            
            cell.configure(mainLabelText: LocalStore.shared.taskArray[indexPath.row].mainname, descriptionLabelText:
                            LocalStore.shared.taskArray[indexPath.row].descriptionName, imageName: (LocalStore.shared.taskArray[indexPath.row].status == false) ? "square" : "square.fill")
            
        } else if segmentedControlPosition == "ToDo" {
            
            if LocalStore.shared.taskArray[indexPath.row].status == false {
                cell.configure(mainLabelText: LocalStore.shared.taskArray[indexPath.row].mainname, descriptionLabelText:
                                LocalStore.shared.taskArray[indexPath.row].descriptionName, imageName: "square")
            }
            
        } else if segmentedControlPosition == "Done"{
            
            if LocalStore.shared.taskArray[indexPath.row].status == true {
                cell.configure(mainLabelText: LocalStore.shared.taskArray[indexPath.row].mainname, descriptionLabelText:
                                LocalStore.shared.taskArray[indexPath.row].descriptionName, imageName: "square.fill")
            }
        }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
        
    }
}

extension TaskListViewController: UITableViewDelegate {
    
    //Нажатие ряда таблицы
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addTaskEditorViewController = TaskEditorViewController()  //нажат ряд
        navigationController?.pushViewController(addTaskEditorViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //высота ячейки
    }
    
    @objc func openTaskViewController() {
        let openNewTaskViewController = AddNewTaskViewController()
        present(openNewTaskViewController, animated: true)  //present - показали и убрали
    }
    
    @objc func logOutButtonTapped() {
        
        let loginViewController = LoginViewController()
        self.dismiss(animated: true, completion: nil)
    }
}

