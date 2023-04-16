//
//  CoreDataSecondApp.swift
//  CoreDataSecond
//
//  Created by Robert-Dumitru Oprea on 15/04/2023.
//

import SwiftUI

@main
struct CoreDataSecondApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
