//
//  MainAppView.swift
//  DeviceScanFinder
//
//  Created by Николай Никитин on 12.09.2023.
//

import SwiftUI

// Bezieer path for lower controls corner
struct CustomCorner: Shape {
  var corners: UIRectCorner

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect,
                            byRoundingCorners: corners,
                            cornerRadii: CGSize(width: 35, height: 35))
    return Path(path.cgPath)
  }
}

struct MainAppView: View {

  // MARK: - Dependencies
  @State private var isOn = false
  @State private var showPaywall = true
  @State var edges = UIApplication.shared.windows.first?.safeAreaInsets

  // MARK: Body
  var body: some View {
    ZStack {
      Color("backgroundColor").ignoresSafeArea()
      VStack {
        HStack {
          Button(action: {}, label: {
            Image(systemName: "clock.arrow.circlepath")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .padding(8)
              .padding(2)
              .foregroundColor(.white)
              .background(Color("purpleColorFromFigma"))
              .cornerRadius(16)
          })
          .frame(width: 44, height: 44)
          Spacer()
          ToggleView(isSwitchOn: $isOn)
          Spacer()

          Button(action: {}, label: {
            Image(systemName: "gearshape")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .padding(8)
              .padding(2)
              .foregroundColor(.white)
              .background(Color("purpleColorFromFigma"))
              .cornerRadius(16)
          })
          .frame(width: 44, height: 44)
        }
        .padding(.leading, 8)
        .padding(.trailing, 8)
        Spacer()
      }

      VStack {
        Image("bluetoothIcon")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 64, height: 64)

        Text("Please access Bluetooth")
          .multilineTextAlignment(.center)
          .font(.custom("Rubik-Medium", size: 15).bold())
          .foregroundColor(Color("unactiveColor"))
          .padding()
      }

      VStack {
        Spacer()
        Button(action: {
          withAnimation(.easeInOut(duration: 1.0)) {

          }
        }) {
          Text("ALLOW")
            .frame(width: 343, height: 56, alignment: .center)
            .background(Color("purpleColorFromFigma"))
            .font(.custom("Rubik-Medium", size: 17))
            .foregroundColor(.white)
            .cornerRadius(16)
            .padding()
        }
        .buttonStyle(.automatic)

        VStack {
          HStack {
            Text("Devices: 0")
              .font(.custom("Rubik-Regular", size: 22))
              .padding(.bottom, 40)
              .padding(.top, 18)
          }

          HStack {
            Button(action: { }) {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .padding(8)
                    .background(Circle().foregroundColor(Color("activeColor").opacity(0.2)))
                    .foregroundColor(Color("activeColor"))
            }
            .frame(width: 46, height: 46)


            Button(action: { }) {
                Image("podcast_share")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .padding(8)
                    .background(Circle().foregroundColor(Color("activeColor")))

            }
            .frame(width: 68, height: 68)
            .padding(.leading, 60)
            .padding(.trailing, 60)

            Button(action: { }) {
                Image(systemName: "book")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .padding(8)
                    .background(Circle().foregroundColor(Color("activeColor").opacity(0.2)))
                    .foregroundColor(Color("activeColor"))
            }
            .frame(width: 46, height: 46)
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 10)
        .padding(.bottom, edges?.bottom)
        .background(Color.white.clipShape(CustomCorner(corners: [.topLeft, .topRight])))
      }
      .ignoresSafeArea()
      PaywallView(show: $showPaywall, purchased: .monthly)
    }

  }
}

struct MainAppView_Previews: PreviewProvider {
  static var previews: some View {
    MainAppView()
  }
}
