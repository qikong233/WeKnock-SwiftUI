//
//  MePage.swift
//  WeKnock-SwiftUI
//
//  Created by qikong on 2020/6/18.
//  Copyright © 2020 qikong233. All rights reserved.
//

import SwiftUI

class MeModel: ObservableObject {
    
}

struct MePage: View {
    
    @ObservedObject var model = MeModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Spacer(minLength: 30)
                InfoCard().padding(.bottom, 20)
                MePageRow(title: "Shop", icon: "shop")
                MePageRow(title: "Ticket", icon: "tick")
                MePageRow(title: "Member", icon: "diamond")
                MePageRow(title: "Collection", icon: "like")
            }
        }.navigationBarItems(trailing: NavigationLink(destination: HomePage(), label: {
            Image("setting").renderingMode(.original)
        }))
    }

}

struct InfoCard: View {
    @State var progressValue: Float = 0.0
    @State var isVip: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.yellow)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 400, alignment: .topLeading)
                .cornerRadius(20, antialiased: true)
            VStack {
                Image(self.isVip ? "vip" : "not_vip").resizable().frame(width: 60, height: 50)
                Image("avatar").frame(width: 100, height: 100).padding(.bottom, 20).padding(.top, 5)
                Text("Matrix Mysterious Box").bold().font(.system(size: 24)).foregroundColor(.white).padding(10)
                Text("Star: 100").bold().font(.system(size: 17)).foregroundColor(.white)
                ProgressBar(value: $progressValue).frame(width: UIScreen.main.bounds.width * 0.6, height: 20)
            }.frame(alignment: .center)
        }.onAppear {
            self.progressValue = 0.6
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isVip = true
            }
        }
    }
    
}

struct MePageRow: View {
    
    var title: String?
    var icon: String?
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.yellow)
                .frame(width: UIScreen.main.bounds.width * 0.85, height: 64, alignment: .topLeading)
                .cornerRadius(20, antialiased: true)
                .opacity(0.3)
            HStack(spacing: 100) {
                HStack() {
                    Image("\(self.icon ?? "")").resizable().frame(width: 35, height: 35)
                    Text(self.title ?? "").bold().foregroundColor(.gray)
                }.frame(width: 150, alignment: .leading)
                Image("arrow").resizable().frame(width: 25, height: 25)
            }
        }.onTapGesture {
            self.onTap()
        }
    }
        
    func onTap() {}
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .opacity(0.3)
                    .foregroundColor(.white)
                Rectangle().frame(width: (geometry.size.width * CGFloat(self.value)), height: geometry.size.height)
                    .foregroundColor(Color(.white))
                    .animation(.spring())
            }.cornerRadius(10)
        }
    }
}

struct MePage_Previews: PreviewProvider {
    static var previews: some View {
        MePage()
    }
}
