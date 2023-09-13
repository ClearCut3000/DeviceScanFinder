//
//  ContentView.swift
//  DeviceScanFinder
//
//  Created by Николай Никитин on 12.09.2023.
//

import SwiftUI

struct ContentView: View {

  // MARK: - Dependencies
  @State private var showMainApp = false
  @State private var currentPage = 0
  let pages: [OnboardingPage]

  // MARK: - View Body
  var body: some View {
    if showMainApp {
        MainAppView()
    } else {
      VStack {
        TabView(selection: $currentPage) {
          ForEach(0..<self.pages.count) { page in
            OnboardingView(page: self.pages[page])
              .tag(page)
              .padding()
          }
        }
        .tabViewStyle(.page)

        HStack {
          Button(action: {
            if currentPage == 2 {
              withAnimation(.easeInOut(duration: 1.0)) {
                showMainApp = true
              }
            } else {
              withAnimation(.easeInOut(duration: 1.5)) {
                self.currentPage = (self.currentPage + 1) % self.pages.count
              }
            }
          }) {
            Text("NEXT")
              .frame(width: 343, height: 56, alignment: .center)
              .background(Color("purpleColorFromFigma"))
              .font(.custom("Rubik-Medium", size: 17))
              .foregroundColor(.white)
              .cornerRadius(16)
              .padding()
          }
          .buttonStyle(.automatic)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(pages: OnboardingPage.pages)
  }
}

