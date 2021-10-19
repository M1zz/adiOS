//
//  Main.swift
//  adiOS
//
//  Created by 이현호 on 2021/10/15.
//

import SwiftUI

struct Main: View {

    var body: some View {
        //NavigationView {
            TabView {
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                Schedule()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Schedule")
                    }
                
                Goods()
                    .tabItem {
                        Image(systemName: "gift")
                        Text("Goods")
                    }
                
                Contact()
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("Contact")
                    }
            }
        //}
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
