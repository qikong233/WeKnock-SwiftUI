//
//  ContentView.swift
//  WeKnock-SwiftUI
//
//  Created by qikong on 2020/6/18.
//  Copyright © 2020 qikong233. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 0
    
    let tabs = ["home", "activity", "me"]
    
    var body: some View {

        TabView(selection: $index) {
            /**************************************************/
            // Home
            NavigationView{
                HomePage()
                    .navigationBarTitle("Home")
                    .navigationBarHidden(false)
            }
                .tabItem {
                    if index == 0 {
                        Image("\(self.tabs[0])_sel")
                    } else {
                        Image("\(self.tabs[0])")
                    }
                    Text(self.tabs[0])
            }.tag(0)
            
            /**************************************************/
            // Activity
            NavigationView{
                ActivityPage()
                    .navigationBarTitle("Activity")
                    .navigationBarHidden(false)
            }
                .tabItem {
                    if index == 1 {
                        Image("\(self.tabs[1])_sel")
                    } else {
                        Image("\(self.tabs[1])")
                    }
                    Text(self.tabs[1])
            }.tag(1)
            
            /**************************************************/
            // Me
            NavigationView {
                MePage()
                    .navigationBarTitle("Me")
                    .navigationBarHidden(false)
            }
                .tabItem {
                    if index == 2 {
                        Image("\(self.tabs[2])_sel")
                    } else {
                        Image("\(self.tabs[2])")
                    }
                    Text(self.tabs[2])
            }.tag(2)
        }.accentColor(.yellow)
         .navigationBarTitle("TabViewPage")
    }
}

fileprivate struct TabItemPage: View {
    var index: Int
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.yellow)
            VStack {
                Text("\(index)")
                    .foregroundColor(.white)
                    .font(.system(size: 100, design: .rounded))
                    .bold()
            }
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
