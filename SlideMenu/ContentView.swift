//
//  ContentView.swift
//  SlideMenu
//
//  Created by Taichi Uragami on 2021/11/01.
//

import SwiftUI

struct ContentView: View {
    @State var menuOpened = false
    
    var body: some View {
        ZStack {
            //            if !menuOpened {
            NavigationView {
                Text("Hello  World!")
                    .navigationTitle("Slide Menu")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button(action: {
                                self.menuOpened.toggle()
                            },
                                   label: {
                                Text("Open Menu")
                                
                            })
                        }
                    }
            }
            //            }
            if menuOpened {
                SideMenuView(width: UIScreen.main.bounds.width/1.6, menuOpened: menuOpened, toggleMenu: toggleMenu)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
