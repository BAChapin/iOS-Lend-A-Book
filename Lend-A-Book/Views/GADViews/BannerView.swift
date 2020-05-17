//
//  BannerView.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/16/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import GoogleMobileAds
import SwiftUI
import UIKit

struct BannerView: UIViewRepresentable {
    typealias UIViewType = GADBannerView
    
    func makeUIView(context: UIViewRepresentableContext<BannerView>) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = FBService.adUnitID.banner
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<BannerView>) {
        // TODO: Research what would be useful to put here.
    }
}
