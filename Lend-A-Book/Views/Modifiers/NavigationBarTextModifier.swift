//
//  NavigationBarTextModifier.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/14/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

struct NavigationBarTextModifier: ViewModifier {
    var textColor: UIColor
    
    init(textColor: UIColor) {
        self.textColor = textColor
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [.foregroundColor : textColor]
        appearance.largeTitleTextAttributes = [.foregroundColor : textColor]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = textColor
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarTextColor(_ textColor: UIColor) -> some View {
        self.modifier(NavigationBarTextModifier(textColor: textColor))
    }
}
