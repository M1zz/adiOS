//
//  Profile.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/18.
//

import Foundation

var profiles = MockData.adiOSMembers

struct Profile: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let company: String
    let aboutMe: String
    var email: String? = nil
    var blogUrlString: String? = nil
    var githubUrlString: String? = nil
}

extension MockData {
    static let adiOSMembers = [Profile(imageName: "guk",
                                       name: "국윤수",
                                       company: "mathpresso",
                                       aboutMe: "유쾌하고 명료한 개발자.",
                                       email: "krgoodnews@gmail.com",
                                       blogUrlString: "https://yunsu.dev/",
                                       githubUrlString: "https://github.com/krgoodnews"),
                               Profile(imageName: "sik",
                                       name: "유현식",
                                       company: "Frip",
                                       aboutMe: "비워두겠읍니다.",
                                       email: "dbgustlr92@gmail.com",
                                       blogUrlString: "https://macgongmon.club/",
                                       githubUrlString: "https://github.com/Hyunsik-Yoo"),
                               Profile(imageName: "ho",
                                       name: "이현호",
                                       company: "wadiz",
                                       aboutMe: "여러 사람과 같이 일하고 싶은 개발자",
                                       email: "leeo@kakao.com",
                                       blogUrlString: "https://dev200ok.blogspot.com",
                                       githubUrlString: "https://github.com/M1zz")]
    
    static let member = Profile(imageName: "ho",
                                name: "이현호",
                                company: "wadiz",
                                aboutMe: "이현호에 대한 소개입니다")
}
