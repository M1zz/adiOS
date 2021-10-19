//
//  MediumButton.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct MediumButton: View {
    
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    let event: Event
    
    var body: some View {

        
        HStack(alignment: .top) {

            VStack(alignment: .leading, spacing: 10) {
                
                Text(event.title)
                    .font(isSmallDevice ? .title2 : .title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text(event.description)
                    .font(isSmallDevice ? .caption : .none)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black.opacity(0.6))
            }
            .padding(.top,30)
            .padding(.leading)
            
            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 180)
                .offset(x: 15, y: -15)
        }
        .padding()
        .background(
            event.color
                .cornerRadius(30)
                .padding(.bottom,30)
                .padding(.top,30)
        )
        .frame(width: UIScreen.main.bounds.width - 8)
        .padding(.top)
    }
}

struct MediumButton_Previews: PreviewProvider {
    static var previews: some View {
        MediumButton(event: MockData.sampleMediumEvent)
    }
}
