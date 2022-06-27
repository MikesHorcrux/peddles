//
//  MissionStatementView.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/26/22.
//

import SwiftUI

struct MissionStatementView: View {
    var missionStatement: String?
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 20){
            if missionStatement != nil{
                
            Text("Our Mission: ")
                    .font(.subheadline)
                    .bold()
                    
            Text(missionStatement ?? "")
                    .padding(.leading, 15)
                    .font(.body)
                
            } else{
            EmptyView()
            }
        }
        .padding()
    }
}

#if DEBUG
struct MissionStatementView_Previews: PreviewProvider {
    static var previews: some View {
        let org: Organization = .create()
        VStack {
            MissionStatementView(missionStatement: org.missionStatement)
            MissionStatementView(missionStatement: "Here at xyz we are blah to blah to help animals rumbling rumbling, add something and now big finnish....... were not done something emotional and boom.")
        }
    }
}
#endif
