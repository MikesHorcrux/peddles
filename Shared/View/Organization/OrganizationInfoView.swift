//
//  OrganizationInfoView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/30/22.
//

import SwiftUI

struct OrganizationInfoView: View {
    
    var org: Organization?
    var location: AnnotationModel?
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: org?.photos?.first?.full ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
                    .background(Color.gray)
            }
            .frame(width: 100, height: 100)
            .overlay(
                Circle().stroke(Color.secondary, lineWidth: 8)
            )
            .clipShape(Circle())
            
            AddressView(org: org, location: location)
        }
    }
}

struct OrganizationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationInfoView()
    }
}
