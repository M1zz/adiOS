//
//  Contact.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct Contact: View {
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack{
                
                Text("Organizer")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor.label))
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color(UIColor.systemBackground)
                            .shadow(color: Color(UIColor.label).opacity(0.18), radius: 5, x: 0, y: 5))
            .zIndex(0)

            
            GeometryReader{mainView in
                
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(profiles, id: \.id) { profile in
                            GeometryReader { item in
                                ProfileCardView(profile: profile)
                                    .scaleEffect(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY),anchor: .bottom)
                                    .opacity(Double(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))
                            }
                            .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top,25)
                }
                .zIndex(1)
            }
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
    }

    private func scaleValue(mainFrame : CGFloat,minY : CGFloat)-> CGFloat {

        withAnimation(.easeOut) {
            let scale = (minY - 25) / mainFrame
            return scale > 1 ? 1 : scale
        }
    }
}

struct Contact_Previews: PreviewProvider {
    static var previews: some View {
        Contact()
    }
}

