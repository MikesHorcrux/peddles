//
//  peddlesApp.swift
//  Shared
//
//  Created by Mike  Van Amburg on 6/23/22.
//

import SwiftUI

@main
struct peddlesApp: App {
    @StateObject var auth = AuthManager(client: DefaultAPIClient.shared)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    auth.token = nil
                }
        }
    }
}
