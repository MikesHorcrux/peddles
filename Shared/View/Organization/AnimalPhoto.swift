//
//  AnimalPhoto.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/27/22.
//

import SwiftUI

struct AnimalPhoto: View {
    var img: String
    var body: some View {
        AsyncImage(url: URL(string: img)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "photo")
                .imageScale(.large)
                .background(Color.gray)
                .frame(width: 130, height: 130)
        }
        .background(Color.gray)
        .frame(width: 130, height: 130)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct AnimalPhoto_Previews: PreviewProvider {
    static var previews: some View {
        AnimalPhoto(img: "https://erepublic.brightspotcdn.com/dims4/default/3ae966f/2147483647/strip/false/crop/5938x3959+0+0/resize/1486x991!/quality/90/?url=http%3A%2F%2Ferepublic-brightspot.s3.amazonaws.com%2F7d%2Fe8%2F5279a674416a8eccec1661af5a54%2Fshutterstock-1896948175.jpg")
    }
}
