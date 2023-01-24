//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Adam Palmer on 23/01/2023.
//

import UIKit

class TodoList: NSObject {
    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items")
    }()
   
    fileprivate var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("Saving items to \(fileURL)")
        if !itemsArray.write(to: fileURL, atomically: true) { // Attempts to save contents of array, bool = succeeded or not
            print("Could not save to-do list")
        }
    }
    
    // If array can be constructed, can cast the array to [String], store it in TodoList's items property.
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String] { // attempt to construct NSArray using its initialiser which expects a URL from which the array should be loaded.
            items = itemsArray
        }
    }
    
    func add(_ item: String) {
        items.append(item)
        saveItems()
    }
}

extension TodoList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
}
