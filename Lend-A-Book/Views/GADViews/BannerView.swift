//
//  BannerView.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 7/23/20.
//

import GoogleMobileAds
import SwiftUI
import UIKit

struct BannerView: UIViewRepresentable {
    
    private let identifier = "ca-app-pub-2892923928204043/2052191347"
    
    func makeUIView(context: Context) -> some GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = identifier
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // TODO: Research what would be useful to put here.
    }
}
