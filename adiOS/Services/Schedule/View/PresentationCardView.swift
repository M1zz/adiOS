//
//  TaskCardView.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct PresentationCardView: View {
    
    let presentation: Presentation
    @State private var isShowingSafariView = false
    @State private var isShowingAlert = false
    
    var body: some View {
        ZStack {
            BackgroundView(backgroundColor: presentation.color)
                .frame(width: UIScreen.main.bounds.width - 20,
                       height: 200, alignment: .leading)
                .background(presentation.color)
                .opacity(0.5)
                .cornerRadius(15.0)
                .clipped()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(presentation.title)
                        .font(.title2)
                        .padding()
                    Text(presentation.presenter)
                        .padding()
                        .background(Color.yellow)
                        .frame(height: 30)
                        .cornerRadius(8.0)
                        .clipped()
                }
                .padding()

                
                Image(presentation.profileImageName)
                    .resizable()
                    .cornerRadius(15.0)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
            }
            .frame(width: UIScreen.main.bounds.width - 20,
                   height: 200, alignment: .leading)
            
            .onTapGesture {
                if presentation.presentationUrlString == "" {
                    isShowingAlert = true
                } else {
                    isShowingSafariView = true
                }
                
            }
            .fullScreenCover(isPresented: $isShowingSafariView, content: {
                SafariView(url: URL(string: presentation.presentationUrlString) ?? URL(string: "www.apple.com")!)
            })
            .alert(isPresented: $isShowingAlert, content: {
                Alert(title: Text("아직 준비되지 않았습니다."))
            })
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationCardView(presentation: Presentation(title: "코드를 짜면서 겪은 오해의 순간들", presenter: "이현호", color: Color("Color"), profileImageName: "ho", presentationUrlString: "https://www.slideshare.net/hyunhoLee16/ios-250294782"))
    }
}

struct BackgroundView: View {
    let backgroundColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [backgroundColor, backgroundColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
