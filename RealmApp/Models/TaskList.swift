//
//  TaskList.swift
//  RealmApp
//
//  Created by Вячеслав Квашнин on 14.04.2022.
//

import Foundation
import RealmSwift

class TaskList: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    let tasks = List<Task>()
}


class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = false
}
