//
//  SplashScreenView.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import SwiftUI

// View representing a splash screen
struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            Image(Images.logo)
                .resizable()
                .scaledToFit()
                .frame(width: Sizes.s200, height: Sizes.s200)
                .cornerRadius(Sizes.s16)
        }
    }
}

// Preview
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
