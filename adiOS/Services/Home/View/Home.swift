//
//  Home.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                MediumButton(event: MockData.sampleMediumEvent)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 15), count: 2),spacing: 20){
                    
                    ForEach(MockData.sampleSmallEvents) { item in
                        SmallButton(event: item)
                    }
                }
                .padding(.top,10)
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
