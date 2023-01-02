//
//  JsonSwiftUIApp.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/02.
//

import SwiftUI

@main
struct JsonSwiftUIApp: App {
    var body: some Scene {
        let login = PostViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
