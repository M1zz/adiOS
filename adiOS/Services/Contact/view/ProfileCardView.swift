//
//  ProfileCardView.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/18.
//

import SwiftUI

struct ProfileCardView : View {
    var profile : Profile
    @State var isPresented = false
    @State var isShowingSafariView = false
    @State var isShowingSafariView2 = false
    
    var body: some View {
        
        HStack{
            
            Image(profile.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text(profile.name)
                    .fontWeight(.bold)
                Text(profile.company)
            }
            .padding(.leading,10)
            Spacer(minLength: 0)
        }
        .background(Color(UIColor.systemBackground).shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 4))
        .cornerRadius(15)
        .onTapGesture {
            isPresented = true
        }
        .sheet(isPresented: $isPresented, content: {
            ProfileDetailView(isShowingDetailView: $isPresented,
                              isShowingSafariView: $isShowingSafariView,
                              isShowingSafariView2: $isShowingSafariView2,
                              profile: profile)
        })
    }
}


struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView(profile: MockData.member)
    }
}
