//
//  SlideMenu.swift
//  SlideMenu
//
//  Created by Taichi Uragami on 2021/11/01.
//

import SwiftUI

struct MenuContentView: View {
    let items: [MenuItem] = [
        MenuItem(text: "Home", imageName: "house"),
        MenuItem(text: "Archive", imageName: "archivebox"),
        MenuItem(text: "Setting", imageName: "gear"),
        MenuItem(text: "Share", imageName: "square.and.arrow.up")
        ]

    var body: some View {
        ZStack{
            Color(UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1))
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32, alignment: .center)
                        Text(item.text)
                            .bold()
                            .font(.system(size: 22))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .onTapGesture {
                        item.handler()
                    }
                    .padding()
                    
//                    Divider()
                }
            }
            .padding(.bottom, 45)
        }
    }
}
struct SideMenuView: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    var body: some View {
        ZStack{
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeInOut.delay(0.5))
            .onTapGesture {
                self.toggleMenu()
            }
            HStack {
                MenuContentView()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                Spacer()
            }
        }
    }
}

