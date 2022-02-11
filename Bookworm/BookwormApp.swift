//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Alex Paz on 09/02/2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    // creates the data controller instance and keeps it alive the entire app life because of StateObject and modifier below
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            // now over to retrieving and synchronizing data with permanent storage with @FetchRequest on ContentView.swift
        }
    }
}
