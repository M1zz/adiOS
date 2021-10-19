//
//  ProfileDetailView.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct ProfileDetailView: View {

    @Binding var isShowingDetailView: Bool
    @Binding var isShowingSafariView: Bool
    @Binding var isShowingSafariView2: Bool
    
    let profile: Profile
    
    var body: some View {
        ZStack{
            
            Image(profile.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    
                    Spacer()
    
                    Button(action: {
                        isShowingDetailView = false
                    }) {
                        Image("close")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                
                Spacer()
                
                ZStack(alignment: .top) {
                    
                    VStack{
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text(profile.name).font(.title)
                            }
                            
                            Spacer()
                            
//                            HStack(spacing: 8){
//                                Image("map")
//                                    .resizable()
//                                    .frame(width: 15, height: 20)
//                                Text("8 Miles")
//                            }
//                            .padding(8)
//                            .background(Color.black.opacity(0.1))
//                            .cornerRadius(10)
                        }
                        .padding(.top,35)
                        
                        Text(profile.aboutMe)
                            .padding(.top)
                        
                    }
                    .padding()
                    .background(Blurview())
                    .clipShape(BottomShape())
                    .cornerRadius(25)
                    
                    ZStack{
                        
                        Button(action: {
                            if let email = profile.email,
                               let url = URL(string: "mailto:\(email)") {
                               UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }) {
                            Image(systemName: "envelope")
                                .renderingMode(.template)
                                .foregroundColor(.red)
                                .font(.system(size: 25, weight: .bold))//.frame(width: 40, height: 40)
                                .padding(20)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        
                        Circle()
                            .stroke(Color.red, lineWidth: 5)
                            .frame(width: 70, height: 70)
                        
                    }
                    .offset(y: -35)
                    
                    HStack{
                        
                        Button(action: {
                            if profile.githubUrlString != nil {
                                isShowingSafariView = true
                            }
                        }) {
                            
                            Image("github")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .fullScreenCover(isPresented: $isShowingSafariView, content: {
                            if let githubUrlString = profile.githubUrlString {
                                SafariView(url: URL(string: githubUrlString) ?? URL(string: "www.apple.com")!)
                            }
                        })
                    
                        Spacer()
                        
                        Button(action: {
                            if profile.blogUrlString != nil {
                                isShowingSafariView2 = true
                            }
                        }) {
                            
                            Image(systemName: "doc.plaintext")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(.system(size: 20, weight: .light))
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .fullScreenCover(isPresented: $isShowingSafariView2, content: {
                            if let blogUrlString = profile.blogUrlString {
                                SafariView(url: URL(string: blogUrlString) ?? URL(string: "www.apple.com")!)
                            }
                        })
                    }.offset(y: -25)
                    .padding(.horizontal,35)
                }
                
            }.padding()
        }
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(isShowingDetailView: .constant(true),
                          isShowingSafariView: .constant(true),
                          isShowingSafariView2: .constant(true),
                          profile: MockData.member)
    }
}

struct BottomShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: 42, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
            
        }
    }
}

struct Blurview : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Blurview>) -> UIVisualEffectView {
        
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Blurview>) {
        
        
    }
}
