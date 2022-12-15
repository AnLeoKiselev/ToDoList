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
    var status: Bool
}

class LocalStore {
    
    static let shared = LocalStore()
    
    //let image = UIImage(systemName: <#T##String#>)
    
    var taskArray: [Task] = [
        Task(mainname: "1 сделано", descriptionName: "1 сделано!", status: true),
        Task(mainname: "2 сделано", descriptionName: "2 сделано!", status: true),
        Task(mainname: "3 не сделано", descriptionName: "3 не сделано!", status: false),
        Task(mainname: "4 не сделано", descriptionName: "4 не сделано!", status: false)
    ]
}

//LocalStore.shared.taskArray.append(newTask)

