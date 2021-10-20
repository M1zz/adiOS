//
//  Goods.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct Goods: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    @State private var isShowingSheet: Bool = false
    @StateObject var viewModel = GoodsViewModel()
    
    var body: some View {
        
        VStack {
            HStack{
                
                Text("Badges")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor.label))
                
                Spacer(minLength: 0)
                
                Button(action: {
                    isShowingSheet.toggle()
                }) {
                    Text("티켓 입력")
                }
                .sheet(isPresented: $isShowingSheet,
                       onDismiss: didDismiss) {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                isShowingSheet.toggle()
                            }, label: {
                                Image("close")
                                    .renderingMode(.template)
                                    .resizable()
                                    .foregroundColor(Color(UIColor.label))
                                    .frame(width: 20, height: 20)
                                    .padding()
                            })
                        }
                        Spacer()
                        VStack {
                            ScannerView(scannedCode: $viewModel.scannedCode,
                                        alertItem: $viewModel.alertItem)
                                .frame(maxWidth: .infinity, maxHeight: 300)
                            Spacer()
                                .frame(height:60)
                            
                            Label("티켓을 스캔해주세요", systemImage: "barcode.viewfinder")
                                .font(.title)

                            Text(viewModel.statusText)
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(viewModel.statusTextColor)
                                .padding()
                        }
                        .alert(item: $viewModel.alertItem) { alertItem in
                            Alert(title: Text(alertItem.title),
                                  message: Text(alertItem.message),
                                  dismissButton: alertItem.dismissButton)
                        }
                        Spacer()
                    }
                }
                
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color(UIColor.systemBackground)
                            .shadow(color: Color(UIColor.label).opacity(0.18), radius: 5, x: 0, y: 5))
            .zIndex(0)
            
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.badges) { badge in
                        BadgeView(badge: badge)
                            .onTapGesture {
                                
                            }
                    }
                })
            }
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            if UserDefaults.standard.bool(forKey: "first") {
                var data = MockData.badges
                data[0].isJoined = true
                viewModel.badges = data
            } else {
                viewModel.badges = MockData.badges
            }
        }
    }
    
    private func didDismiss() {
        // Handle the dismissing action.
    }
}

struct Goods_Previews: PreviewProvider {
    static var previews: some View {
        Goods()
    }
}





//////

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertConText {
    static let invalidDeviceInput = AlertItem(title: "잘못된 디바이스 인풋",
                                              message: "카메라에 문제가 있습니다. 입력장치를 찾을 수 없습니다.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScannedType = AlertItem(title: "잘못된 스캔타입",
                                              message: "스캐닝 된 값이 유효하지 않습니다. 이 앱은 EAN-8과 EAN-13을 스캔합니다.",
                                              dismissButton: .default(Text("Ok")))
}
