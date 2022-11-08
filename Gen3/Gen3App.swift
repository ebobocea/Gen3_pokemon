//
//  Gen3App.swift
//  Gen3
//
//  Created by Elisei Bobocea on 08/11/2022.
//

import SwiftUI

@main
struct Gen3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
