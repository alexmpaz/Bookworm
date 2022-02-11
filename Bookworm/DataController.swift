//
//  DataController.swift
//  Bookworm
//
//  Created by Alex Paz on 11/02/2022.
//
import CoreData
import Foundation


// setting up of Data Controller
class DataController: ObservableObject {
    // this tells CoreData we want to use the Bookworm data model we've created earlier, see file Bookworm.xcdatamodeld
    let container = NSPersistentContainer(name: "Bookworm")
    
    // small initializer to load stored data immediately
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
