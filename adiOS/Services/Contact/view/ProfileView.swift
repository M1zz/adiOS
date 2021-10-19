//
//  ProfileView.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct ProfileView: View {
    
    let profile: Profile
    
    var body: some View {
        HStack {
            Image(profile.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
            VStack {
                Text(profile.name)
                Text(profile.company)
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: MockData.member)
    }
}



