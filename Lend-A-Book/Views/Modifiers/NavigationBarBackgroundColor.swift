//
//  NavigationBarBackgroundColor.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 7/23/20.
//

import SwiftUI

struct NavigationBarBackgroundColor: ViewModifier {
    
    var backgroundColor: UIColor?
    
    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                        
                    Spacer()
                }
            }
        }
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarBackgroundColor(backgroundColor: backgroundColor))
    }
}

