//
//  AnimalCard.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/30/22.
//

import SwiftUI

struct AnimalCard: View {
    var img: String
    var name: String
    var breed: String
    var animalType: String
    var color: String
    var description: String
    
    init(img: String, name: String, breed: String, animalType: String, color: String, description: String) {
        self.img = img
        self.name = name
        self.breed = breed
        self.animalType = animalType
        self.color = color
        self.description = description
    }
    
    var body: some View {
        HStack{
            animalImg
            VStack(alignment: .leading, spacing: 10){
                HStack(alignment: .top){
                    animalName
                    typeColor
                    animalColor
                    Spacer()
                }
                Text(description)
                    .font(.subheadline)
                    .lineLimit(3)
            }
        }
        .padding()
        .background(Color("ColorCard"))
        .clipShape(
            RoundedRectangle(cornerRadius: 10)
        )
        .shadow(color: .black.opacity(0.5), radius: 3, x: -2, y: 2)
        .padding()
    }
    
    private var animalImg: some View{
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
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var animalName: some View{
        VStack(alignment: .leading) {
            Text("name:")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(name)
                .font(.caption2)
        }
    }
    
    private var typeColor: some View{
        VStack(alignment: .leading){
            Text("color:")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(color)
                .font(.caption2)
        }
    }
    
    private var animalColor: some View {
        VStack(alignment: .leading){
            Text("type:")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(breed)
                .font(.caption2)
        }
    }
    
}

#if DEBUG
struct AnimalCard_Previews: PreviewProvider {
    static var previews: some View {
        AnimalCard(img: "https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60", name: "cutie", breed: "unknown", animalType: "Cat", color: "orange", description: "Nebula is a shorthaired, shy cat. She is very affectionate once she warms up to you.")
    }
}
#endif
