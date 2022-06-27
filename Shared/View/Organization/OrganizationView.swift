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
            AdoptableAnimalsView(animals: animalsViewModel.state.animals)
            MissionStatementView(missionStatement: orgViewModel.state.orgainization?.missionStatement)
            AddressView(org: orgViewModel.state.orgainization?.address)
            
        }
        .onAppear{
            orgViewModel.fetchOrganization(id: orgId)
            animalsViewModel.fetchAnimalsByOrg(id: orgId)
        }
        .navigationTitle(orgViewModel.state.orgainization?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
struct OrganizationView_Previews: PreviewProvider {
    static var previews: some View {
        var orgViewModel = OrganizationsViewModel(client: InMemoryAPIClient())
        OrganizationView(orgId: "")
            .onAppear{
                orgViewModel.state.orgainization = .create()
            }
    }
}
#endif
