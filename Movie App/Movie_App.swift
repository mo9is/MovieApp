//
//  Movie_AppApp.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI

@main
struct Movie_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: HomeViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
