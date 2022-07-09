//
//  AddressView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/27/22.
//

import SwiftUI
import MapKit

struct AddressView: View {
    var org: Organization?
    var location: AnnotationModel?

    var body: some View {
        HStack(alignment: .top, spacing: 7) {
            if let local = location {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: local.latlong, latitudinalMeters: 400, longitudinalMeters: 400)), annotationItems: [local]) { item in
                    MapAnnotation(coordinate: item.latlong) {
                        AsyncImage(url: URL(string: item.img)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Image(systemName: "photo")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                        .overlay(
                            Circle().stroke(Color.secondary, lineWidth: 8)
                        )
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                    }

                }
                .cornerRadius(15)
            }
            VStack(alignment: .leading, spacing: 5) {
                ContactView(phone: org?.phone ?? "", email: org?.email ?? "")
                    .multilineTextAlignment(.leading)
                if let org = org {
                    Text("Our location: ")
                        .padding(.vertical)
                    VStack(alignment: .leading) {
                        if let address1 = org.address.address1 {
                            Text(address1)
                        }
                        if let address2 = org.address.address2 {
                            Text(address2)
                        }
                        Text("\(org.address.city) \(org.address.state), \(org.address.postcode)")
                    }
                } else {
                    EmptyView()
                }
            }
            .font(.caption)
        }
        .frame(height: 200)
        .padding()
    }

}

#if DEBUG
struct AddressView_Previews: PreviewProvider {

    static var previews: some View {

        let address = PFAddress(address1: "1234 Somewhere pl", city: "Austin", state: "TX", postcode: "98747", country: "US")

        VStack {
            AddressView(org: Organization.create(address: address))
            AddressView(org: Organization.create())
        }
    }
}
#endif
