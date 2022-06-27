//
//  OrganizationView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/26/22.
//

import SwiftUI

struct OrganizationView: View {
    @ObservedObject var animalsViewModel = AnimalsViewModel(client: DefaultAPIClient.shared)
    @ObservedObject var orgViewModel = OrganizationsViewModel(client: DefaultAPIClient.shared)
    var orgId: String
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear{
            orgViewModel.fetchOrganization(id: orgId)
            animalsViewModel.fetchAnimalsByOrg(id: orgId)
        }
    }
}

struct OrganizationView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationView(orgId: "")
    }
}
