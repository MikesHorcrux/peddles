//
//  ContactView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/27/22.
//

import SwiftUI

struct ContactView: View {
    var phone: String
    var email: String
    var body: some View {
        VStack(alignment: .leading){
            Text("Contact info:")
                .font(.headline)
                .padding(.vertical)
            HStack {
                Image(systemName: "phone.circle")
                    .font(.callout)
                Text(phone)
                    .font(.callout)
            }
            .padding(.leading)
            HStack {
                Image(systemName: "mail")
                    .font(.callout)
                Text(email)
                    .font(.callout)
            }
            .padding(.leading)
        }
    }
}

#if DEBUG
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(phone: "555-555-555", email: "pets@pets.com")
    }
}
#endif
