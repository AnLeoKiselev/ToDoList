//
//  LocalStore.swift
//  ToDoList
//
//  Created by Anatoliy on 28.11.2022.
//

import Foundation
import UIKit

struct Task {
    var mainname: String
    var descriptionName: String
}

class LocalStore {
    
    static let shared = LocalStore()
    
    //let image = UIImage(systemName: <#T##String#>)
    
    var taskArray: [Task] = [
//        Task(mainname: "some to do", descriptionName: "go to school", status: false),
//        Task(mainname: "dsdsd", descriptionName: "dsdsdsd", status: false)
        Task(mainname: "Помыть кота", descriptionName: "Домашние дела"),
        Task(mainname: "Сходить на работу", descriptionName: "А куда денешься ..."),
        Task(mainname: "Завоевать мир", descriptionName: "Звоните психиатру!"),
        Task(mainname: "Найти жену", descriptionName: "Давно пора")
        
    ]
}

//LocalStore.shared.taskArray.append(newTask)
