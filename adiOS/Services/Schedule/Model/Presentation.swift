//
//  Presentation.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/18.
//

import SwiftUI

struct Presentation: Identifiable {
    let id = UUID()
    let title: String
    let presenter: String
    var color : Color
    let profileImageName: String
    let presentationUrlString: String
}

extension MockData {
    static let presentations = [Presentation(title: "디자인 시스템 반영기",
                                             presenter: "국윤수",
                                             color: Color("Color"),
                                             profileImageName: "guk",
                                             presentationUrlString: "https://www.slideshare.net/hyunhoLee16/ss-250473255"),
                                Presentation(title: "나의 아키텍쳐 패턴 일대기",
                                             presenter: "유현식",
                                             color: Color("Color2"),
                                             profileImageName: "sik",
                                             presentationUrlString: "https://www.slideshare.net/HyunsikYoo/adios-2021-oct"),
                                Presentation(title: "코드를 짜면서 겪은 오해의 순간들",
                                             presenter: "이현호",
                                             color: Color("Color3"),
                                             profileImageName: "ho",
                                             presentationUrlString: "https://www.slideshare.net/hyunhoLee16/ss-250473255")]
    static let secondShow = Presentation(title: "2부 무엇이든 물어보세요",
                                         presenter: "adiOS 멤버",
                                         color: Color("Color1"),
                                         profileImageName: "adios2021",
                                         presentationUrlString: "https://www.slideshare.net/hyunhoLee16/ss-250473255")
}
