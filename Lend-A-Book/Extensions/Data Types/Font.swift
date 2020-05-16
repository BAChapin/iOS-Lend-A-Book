//
//  Font.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/15/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

extension Font {
    static var titleFont: Font {
        let screenHeight = UIScreen.main.bounds.size.height
        let calcSize = screenHeight / 18
        return Font.custom("Noteworthy-Bold", size: calcSize)
    }
}
