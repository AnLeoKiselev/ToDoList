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
        Task(mainname: "some to do", descriptionName: "go to school", status: false),
        Task(mainname: "dsdsd", descriptionName: "dsdsdsd", status: false)
    ]
}
