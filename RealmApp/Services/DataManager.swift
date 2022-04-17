//
//  DataManager.swift
//  RealmApp
//
//  Created by Вячеслав Квашнин on 14.04.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempData(_ completion: @escaping() -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            UserDefaults.standard.set(true, forKey: "done")
            
            let shoppingList = TaskList()
            shoppingList.name = "Shopping List"
            
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2L"
            
            let bread = Task(value: ["Bread", "", Date(), true])
            let apples = Task(value: ["name": "Apple", "note": "2Kg"])
            
            shoppingList.tasks.append(milk)
            shoppingList.tasks.insert(contentsOf: [apples, bread], at: 1)
            
            DispatchQueue.main.async {
                StorageManager.shared.save([shoppingList])
                completion()
            }
        }
    }
}
