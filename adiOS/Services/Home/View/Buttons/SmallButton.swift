//
//  SmallButton.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct SmallButton: View {
    let event: Event
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    @State private var isShowingSafariView = false
    @State private var isShowingAlert = false
    
    
    var body: some View {
        VStack(spacing: 12) {
            
            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3, height: 150)
            
            HStack {
                Text(event.title)
                    .font(isSmallDevice ? .system(size: 14) : .title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.trailing)
                    .lineLimit(2)
            }
        }
        .frame(width: UIScreen.main.bounds.width / 2 - 50)
        .padding(.top)
        .padding(.leading)
        .padding([.bottom,.trailing],5)
        .background(
            event.color.opacity(0.7)
                .clipShape(CustomCorner(corner: [.topLeft,.topRight,.bottomLeft], size: 25))
                .padding(.top,55)
        )
        .onTapGesture {
            if event.urlString == "" {
                isShowingAlert = true
            } else {
                isShowingSafariView = true
            }
            
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: event.urlString) ?? URL(string: "www.apple.com")!)
        })
        .alert(isPresented: $isShowingAlert, content: {
            Alert(title: Text("아직 준비되지 않았습니다."))
        })
        
    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton(event: MockData.sampleSmallEvent)
    }
}
