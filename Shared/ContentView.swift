//
//  ContentView.swift
//  Shared
//
//  Created by Mike  Van Amburg on 6/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var animalsVM = AnimalsViewModel(client: DefaultAPIClient.shared)
    var body: some View {
        VStack {
            Text("Hello, peddles Lets do this!")
                .padding()
            Button("animals") {
                animalsVM.fetchAnimals()
            }
            
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
