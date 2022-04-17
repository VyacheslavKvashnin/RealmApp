//
//  StorageManger.swift
//  RealmApp
//
//  Created by Вячеслав Квашнин on 14.04.2022.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    // MARK: - TaskList
    
    func save(_ taskLists: [TaskList]) {
        write {
            realm.add(taskLists)
        }
    }
    func save(_ taskList: TaskList) {
        write {
            realm.add(taskList)
        }
    }
    
    func delete(_ taskList: TaskList) {
        write {
            realm.delete(taskList.tasks)
            realm.delete(taskList)
        }
    }
    
    func delete(_ task: Task) {
        write {
            realm.delete(task)
        }
    }
    
    func edit(_ taskList: TaskList, newValue: String) {
        write {
            taskList.name = newValue
        }
    }
    
    func edit(_ task: Task, newValue: String, note: String) {
        write {
            task.name = newValue
            task.note = note
        }
    }
    
    func done(_ taskList: TaskList) {
        write {
            taskList.tasks.setValue(true, forKey: "isComplete")
        }
    }
    
    func done(_ task: Task) {
        write {
            task.isComplete.toggle()
        }
    }
    
    
    // MARK: - Tasks
    
    func save(_ task: Task, to taskList: TaskList) {
        write {
            taskList.tasks.append(task)
        }
    }
    
    private func write(_ completion: () -> Void) {
        do {
            try realm.write({
                completion()
            })
        } catch let error {
            print(error)
        }
    }
}
