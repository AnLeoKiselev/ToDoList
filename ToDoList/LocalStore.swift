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
        Task(mainname: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", descriptionName: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", status: true),
        Task(mainname: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", descriptionName: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", status: true),
        Task(mainname: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", descriptionName: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", status: true),
        Task(mainname: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", descriptionName: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", status: true),
    ]
}

//LocalStore.shared.taskArray.append(newTask)

