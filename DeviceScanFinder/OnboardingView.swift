//
//  OnboardingView.swift
//  DeviceScanFinder
//
//  Created by Николай Никитин on 12.09.2023.
//

import SwiftUI

struct OnboardingPage {
  let imageName: String
  let title: String
  let description: String

  static let pages = [
    OnboardingPage(imageName: "scan_the_network",
                   title: "Scan the network",
                   description: "Scan the network to see all suspicious connections"),
    OnboardingPage(imageName: "use_the_camera",
                   title: "Use the camera",
                   description: "Use your phone camera to find hidden devices"),
    OnboardingPage(imageName: "find_devices",
                   title: "Find devices",
                   description: "Read helpful instructions on how to find spy devices")
  ]
}

/// Onboarding base reusable screen
struct OnboardingView: View {

  // MARK: - Dependencies
  let page: OnboardingPage

  // MARK: - View Body
  var body: some View {
    VStack {
      Spacer()
      Image(page.imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 218, height: 218)
        .padding()

      Spacer()
      Group {
        HStack {
          Text(page.title)
            .font(.custom("Rubik-Medium", size: 22))
        }
        HStack {
          Text(page.description)
            .multilineTextAlignment(.center)
            .font(.custom("Rubik-Medium", size: 15))
            .foregroundColor(Color("unactiveColor"))
            .padding()
        }
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(page: OnboardingPage.pages[2])
  }
}
