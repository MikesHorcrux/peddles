//
//  ContentView.swift
//  Shared
//
//  Created by Mike  Van Amburg on 6/23/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var auth = AuthManager(client: DefaultAPIClient.shared)
    var body: some View {
        Text("Hello, peddles Lets do this!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
