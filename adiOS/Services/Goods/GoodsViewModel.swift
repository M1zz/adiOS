//
//  GoodsViewModel.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/18.
//

import SwiftUI

import CoreImage.CIFilterBuiltins

final class GoodsViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    @Published var badges: [Badge] = []
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var statusText: String {
        //scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
        if scannedCode.isEmpty  {
            return "아직 스캔되지 않았습니다"
        } else {
            let scannedUrl = URL(string: scannedCode)
            guard let path = scannedUrl?.pathComponents else { return "Not Yet Scanned" }
            
            let conferenceCode = path[4]
            if conferenceCode == "1809" {
                UserDefaults.standard.set(true, forKey: "first")
                badges[0].isJoined = true
            }

            return "등록성공"//conferenceCode
        }
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
    
    var barcodeImage: UIImage?
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
