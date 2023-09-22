//
//  conscious_lyApp.swift
//  conscious.ly
//
//  Created by Santiago Lucero on 21/09/2023.
//

import SwiftUI
import SwiftData

@main
struct conscious_lyApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
