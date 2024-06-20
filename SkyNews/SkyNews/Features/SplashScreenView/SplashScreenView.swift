//
//  SplashScreenView.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(16)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

