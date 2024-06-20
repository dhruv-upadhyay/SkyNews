//
//  SkyNewsApp.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import SwiftUI

@main
struct YourApp: App {
    @State private var isSplashScreenActive = true

    var body: some Scene {
        WindowGroup {
            if isSplashScreenActive {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isSplashScreenActive = false
                            }
                        }
                    }
            } else {
                NewsFeedListView()
            }
        }
    }
}

