//
//  AdoptableAnimalsView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/27/22.
//

import SwiftUI

struct AdoptableAnimalsView: View {
    var animals: [Animal]
    let columns = [
           GridItem(.adaptive(minimum: 100))
       ]
    var body: some View {
        VStack {
            Text("Meet our adoptable peddles")
                .font(.headline)
                .padding()
            ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(animals) { item in
                                AnimalPhoto(img: item.photos.first?.full ?? "")
                            }
                        }
                        .padding(.horizontal)
                    }
            .frame(maxHeight: 300)
        }
    }
}

struct AdoptableAnimalsView_Previews: PreviewProvider {
    static var previews: some View {
        AdoptableAnimalsView(animals: [Animal.create()])
    }
}
