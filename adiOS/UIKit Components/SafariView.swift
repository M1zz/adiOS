//
//  SafariView.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/18.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
   
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    
}
