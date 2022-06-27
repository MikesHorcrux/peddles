//
//  AddressView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/27/22.
//

import SwiftUI
import MapKit

struct AddressView: View {
    var org: PFAddress?

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 5){
            if let org = org{
                Text("Where we are Located: ")
                    .font(.headline)
                    .padding(.vertical)
                VStack(alignment: .leading){
                    if let address1 = org.address1 {
                        Text(address1)
                    }
                    if let address2 = org.address2 {
                        Text(address2)
                    }
                    Text("\(org.city) \(org.state), \(org.postcode)")
                }
                .padding(.horizontal)
            } else {
                EmptyView()
            }
        }
    }
}

#if DEBUG
struct AddressView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let address = PFAddress(address1: "1234 Somewhere pl", city: "Austin", state: "TX", postcode: "98747", country: "US")
        
        VStack {
            AddressView(org: address)
            AddressView(org: PFAddress.create())
        }
    }
}
#endif
