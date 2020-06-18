//
//  Home.swift
//  WeKnock-SwiftUI
//
//  Created by qikong on 2020/6/18.
//  Copyright © 2020 qikong233. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
            NavigationLink(destination: ActivityPage().navigationBarTitle("sec"), label: {
                Text("Home page").bold().foregroundColor(.yellow)
            })
        }
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
