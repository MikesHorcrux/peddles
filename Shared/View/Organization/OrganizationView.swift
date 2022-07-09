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
    var orgLocation: AnnotationModel?

    var body: some View {
        ScrollView {
            OrganizationInfoView(org: org, location: orgLocation)
            AdoptableAnimalsView(animalsViewModel: animalsViewModel)
        }
        .onAppear {
            animalsViewModel.fetchAnimalsByOrg(id: orgLocation?.id ?? "")
            self.org = orgViewModel.state.organizations?.organizations.first(where: { item in
                item.id == orgLocation?.id ?? ""
            })
        }
        .navigationTitle(org?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
struct OrganizationView_Previews: PreviewProvider {
    static var previews: some View {
        var orgViewModel = MapViewModel(client: InMemoryAPIClient())
        OrganizationView(orgViewModel: orgViewModel)
    }
}
#endif
