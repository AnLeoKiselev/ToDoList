//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 18.11.2022.
// https://www.youtube.com/watch?v=Pu7B7uEzP18

import UIKit
//import SwiftUI

protocol EditTaskVCDelegate {
    func update(taskName: String, descriptionName: String, indexRow: Int)
}

protocol ReloadTaskListTableVCDelegate {
    func reloadTaskListTableViewVC ()
}

class TaskListViewController: UIViewController, EditTaskVCDelegate, ReloadTaskListTableVCDelegate {
    
    func reloadTaskListTableViewVC() {
        taskListTableView.reloadData()
        taskListTableView.backgroundColor = .red
        print ("Works")
    }
    
    var segmentedControlPosition = "All"
    var indexRowTaskListVC = 0
    var taskNameTaskListVC = ""
    var descNameTaskListVC = ""
    
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
    
    private(set) lazy var taskListTableView: UITableView = {
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
            barButtonSystemItem: .add, target: self, action: #selector(openNewTaskViewController))
        
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
            //vibration
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        case 1:
            segmentedControlPosition = "ToDo"
            taskListTableView.reloadData()
            //vibration
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        case 2:
            segmentedControlPosition = "Done"
            taskListTableView.reloadData()
            //vibration
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        default:
            segmentedControlPosition = "All"
        }
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
        if segmentedControlPosition == "ToDo" {
            let toDoArray = LocalStore.shared.taskArray.filter({$0.status == false})
            return toDoArray.count
        } else if segmentedControlPosition == "Done" {
            let toDoArray = LocalStore.shared.taskArray.filter({$0.status == true})
            return toDoArray.count
        } else {
            return LocalStore.shared.taskArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        else {
            return UITableViewCell()
        }
        
        if segmentedControlPosition == "ToDo" {
            let toDoArray = LocalStore.shared.taskArray.filter({$0.status == false})
            
            cell.configure(mainLabelText: toDoArray[indexPath.row].mainname, descriptionLabelText:
                            toDoArray[indexPath.row].descriptionName, imageName: "square", tag: indexPath.row)
            
        } else if segmentedControlPosition == "Done" {
            
            let toDoArray = LocalStore.shared.taskArray.filter({$0.status == true})
            
            cell.configure(mainLabelText: toDoArray[indexPath.row].mainname, descriptionLabelText:
                            toDoArray[indexPath.row].descriptionName, imageName: "square.fill", tag: indexPath.row)
            
            
        } else {
            cell.configure(mainLabelText: LocalStore.shared.taskArray[indexPath.row].mainname, descriptionLabelText:
                            LocalStore.shared.taskArray[indexPath.row].descriptionName, imageName: (LocalStore.shared.taskArray[indexPath.row].status == false) ? "square" : "square.fill", tag: indexPath.row)
        }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
        
    }

}

extension TaskListViewController: UITableViewDelegate {
    
//Нажатие ряда таблицы
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        //push TaskEditorViewController()
        let TaskEditorViewController = TaskEditorViewController()
        
        //делегат в TaskEditorViewController
        taskNameTaskListVC = LocalStore.shared.taskArray[indexPath.row].mainname
        descNameTaskListVC = LocalStore.shared.taskArray[indexPath.row].descriptionName
        indexRowTaskListVC = indexPath.row
        
        TaskEditorViewController.taskNameTaskEditorVC = taskNameTaskListVC
        TaskEditorViewController.descNameTaskEditorVC = descNameTaskListVC
        TaskEditorViewController.indexRowTaskEditorVC = indexRowTaskListVC
        
        TaskEditorViewController.delegate = self
        
        navigationController?.pushViewController(TaskEditorViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //высота ячейки
    }
    
    @objc func openNewTaskViewController() {
        let openNewTaskViewController = AddNewTaskViewController()
        openNewTaskViewController.delegate = self
        
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        //navigationController?.pushViewController(openNewTaskViewController, animated: true )
        present(openNewTaskViewController, animated: true)  //present - показали и убрали
    }
    
    @objc func logOutButtonTapped() {
        let loginViewController = LoginViewController()
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        self.dismiss(animated: true, completion: nil)
    }
    
    func update(taskName: String, descriptionName: String, indexRow: Int) {
        //taskNameTaskListVC = taskName
        //descNameTaskListVC = descriptionName
        //indexRowTaskListVC = indexRow
    }
}
