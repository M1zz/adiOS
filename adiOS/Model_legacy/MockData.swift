//
//  MockData.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct MockData: Identifiable {
    let id = UUID()
    
    static let sampleFramework = Badge(name: "ARKit",
                                           imageName: "arkit",
                                           urlString: "https://developer.apple.com/augmented-reality/arkit",
                                           description: "ARKit 4 introduces a brand-new Depth API, creating a new way to access the detailed depth information gathered by the LiDAR Scanner on iPhone 12 Pro, iPhone 12 Pro Max, and iPad Pro.\n\nLocation Anchors leverages the higher-resolution data in Apple Maps to place AR experiences at a specific point in the world in your iPhone and iPad apps. And support for face tracking extends to all devices with the Apple Neural Engine and a front-facing camera, so even more users can experience the joy of AR in photos and videos.")
    
    
}
