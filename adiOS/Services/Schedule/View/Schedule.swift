//
//  Schedule.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct Schedule: View {
    var body: some View {
        VStack(alignment: .center ,spacing: 20) {
            HStack {
                Text("Time Table")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white.shadow(color: Color.black.opacity(0.18), radius: 5, x: 0, y: 5))
            .zIndex(0)
            
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    ForEach(MockData.presentations) { item in
                        PresentationCardView(presentation: item)
                    }
                    
                    PresentationCardView(presentation: MockData.secondShow)
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            }
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
    }
}

struct Schedule_Previews: PreviewProvider {
    static var previews: some View {
        Schedule()
    }
}

