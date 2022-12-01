//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 18.11.2022.
// https://www.youtube.com/watch?v=Pu7B7uEzP18

import UIKit
import SwiftUI

class TaskListViewController: UIViewController {
    
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
        configureItems()
    }
    
    private func configureItems() {
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Avenir Next Bold", size: 22.0)!]
        
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(openTaskViewController))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(logOutButtonTapped))
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskListTableView.reloadData()
    }
    
    private func addToSubview() {
        view.addSubview(taskListTableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            taskListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
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
        
        cell.configure(mainLabelText: LocalStore.shared.taskArray[indexPath.row].mainname, descriptionLabelText: LocalStore.shared.taskArray[indexPath.row].descriptionName, imageName: "checkmark")
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    
}
    // про табл UITableViewCell - создать массив задач магаз... в станд ячейку перенести - заголовок и описание - навернуть все что есть  - закруглиь, дизайн таблицы ...
extension TaskListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addTaskEditorViewController = TaskEditorViewController()  //нажат ряд
        navigationController?.pushViewController(addTaskEditorViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //высота ячейки
    }
    
    @objc func openTaskViewController() {
        let openNewTaskViewController = AddNewTaskViewController()
        navigationController?.pushViewController(openNewTaskViewController, animated: true)
    }
    
    @objc func logOutButtonTapped() {
        
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
        
        //navigationController?.popViewController(animated: true)
    }
    
    struct ViewControllerProvider: PreviewProvider {
        static var previews: some View {
            TaskListViewController().showPreview()
        }
    }
    
}
