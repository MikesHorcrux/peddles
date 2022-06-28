//
//  OrganizationView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/26/22.
//

import SwiftUI

struct OrganizationView: View {
    @ObservedObject var animalsViewModel = AnimalsViewModel(client: DefaultAPIClient.shared)
    @ObservedObject var orgViewModel: MapViewModel
    @State var org: Organization?
    var orgId: String
    var body: some View {
        VStack {
           AdoptableAnimalsView(animalsViewModel: animalsViewModel)
            Divider()
            if let org = org {
            MissionStatementView(missionStatement: org.missionStatement)
            HStack(alignment: .top) {
                AddressView(org: org.address)
                ContactView(phone: org.phone ?? "unknown", email: org.email ?? "unknown")
            }
            .padding()
            Spacer()
            }
        }
        .onAppear {
           animalsViewModel.fetchAnimalsByOrg(id: orgId)
            self.org = orgViewModel.state.organizations?.organizations.first(where: { item in
                item.id == orgId
            })
        }
        .navigationTitle(orgViewModel.state.orgainization?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
struct OrganizationView_Previews: PreviewProvider {
    static var previews: some View {
        var orgViewModel = MapViewModel(client: InMemoryAPIClient())
        OrganizationView(orgViewModel: orgViewModel, orgId: "")
    }
}
#endif
