//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Michael Knepprath on 9/7/20.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
