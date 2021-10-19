//
//  Event.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import Foundation

import SwiftUI

struct Event: Identifiable {
    var id = UUID().uuidString
    let imageName: String
    let title: String
    let description: String
    var color : Color
    let urlString: String
}

extension MockData {
    static let sampleMediumEvent = Event(imageName: "donot", title: "행사 안내", description: "첫 번째 adiOS 행사에 오신 여러분 환영합니다!", color: Color("pink"), urlString: "")
    static let sampleSmallEvent = Event(imageName: "sweet", title: "티켓 구매", description: "티켓을 구매하고 행사를 신청해보세요!", color: Color("Color"), urlString: "https://festa.io/events/1809")
    static let sampleSmallEvents = [Event(imageName: "sweet",
                                          title: "티켓 구매",
                                          description: "티켓을 구매하고 행사를 신청해보세요!",
                                          color: Color("Color"), urlString: "https://festa.io/events/1809"),
                                    
                                    Event(imageName: "colessumdonut",
                                          title: "물어보세요",
                                          description: "무엇이든 물어보세요!",
                                          color: Color("Color1"),
                                          urlString: "https://forms.gle/CfjFPSJ6VJqxPtGH9"),
                                    
                                    Event(imageName: "nyasaicecream",
                                          title: "기여하기",
                                          description: "앱을 같이만들면서 기여해보세요!",
                                          color: Color("Color2"),
                                          urlString: "https://github.com/M1zz/adiOS"),
                                    
                                    Event(imageName: "seriouslama",
                                          title: "후원하기",
                                          description: "행사를 후원 해주세요!",
                                          color: Color("Color3"),
                                          urlString: "https://goodnews.notion.site/f54c4c7a5e5840c0ba300905e09fe617")]
    
}
