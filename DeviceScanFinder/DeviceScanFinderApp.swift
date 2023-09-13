//
//  DeviceScanFinderApp.swift
//  DeviceScanFinder
//
//  Created by Николай Никитин on 12.09.2023.
//

import SwiftUI

@main
struct DeviceScanFinderApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(pages: OnboardingPage.pages)
        }
    }
}
