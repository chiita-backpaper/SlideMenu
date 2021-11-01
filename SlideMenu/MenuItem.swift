//
//  MenuItem.swift
//  SlideMenu
//
//  Created by Taichi Uragami on 2021/11/01.
//

import Foundation

struct MenuItem: Identifiable {
    var id  = UUID()
    let text: String
    let imageName: String
    let handler: () -> Void = {
        print("Tapped item")
    }
}
