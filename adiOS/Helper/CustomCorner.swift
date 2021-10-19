//
//  CustomCorner.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/18.
//

import SwiftUI

struct CustomCorner : Shape {
    
    var corner : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        return Path(path.cgPath)
    }
}
