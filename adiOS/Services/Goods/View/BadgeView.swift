//
//  BadgeView.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/18.
//

import SwiftUI

struct BadgeView: View {
    
    let badge: Badge
    var isJoined: Bool = true
    
    var body: some View {
        VStack {
            if badge.isJoined {
                Image(badge.imageName)
                    .resizable()
                    .frame(width: 90, height: 90)
            } else {
                Image(badge.imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                    .frame(width: 90, height: 90)
            }
            
            Text(badge.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
    
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(badge: MockData.sampleFramework)
    }
}
