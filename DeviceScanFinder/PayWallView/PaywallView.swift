//
//  PaywallView.swift
//  DeviceScanFinder
//
//  Created by Николай Никитин on 12.09.2023.
//

import SwiftUI

struct PaywallView: View {

  // MARK: - Dependencies
  @Binding var show: Bool
  @State var purchased: PurchaseOptions

  let paywallBenefits = [
    "Network scanner",
    "Infrared camera",
    "Instructions",
    "Bluetooth scanner"
  ]

  // MARK: - Body
    var body: some View {
      ZStack {
        if show {
          Color.white.ignoresSafeArea()
          ZStack {
            Button(action: {
              withAnimation {
                show = false
              }
            }) {
              Image(systemName: "xmark")
                .font(.system(size: 24))
                .foregroundColor(.black)
                .frame(width: 36, height: 36)
            }
            .position(x: UIScreen.main.bounds.width - 36, y: 36)

            VStack {
              Text("Get PRO version")
                .font(.custom("Rubik-Medium", size: 22))

              Text("Upgrade to PRO version to get all these great benefits:")
                .multilineTextAlignment(.center)
                .font(.custom("Rubik-Medium", size: 15).bold())
                .foregroundColor(Color("unactiveColor"))
                .padding()

              VStack(alignment: .leading) {
                ForEach(paywallBenefits, id: \.self) { benefit in
                  HStack {
                    Image(systemName: "checkmark.circle")
                      .resizable()
                      .frame(width: 24, height: 24)
                      .foregroundColor(Color("activeColor"))
                    Text(benefit)
                  }
                }
              }
              .padding(.bottom, 8)

              CheckBoxView(checked: $purchased)
                .padding(.bottom, 8)

              Button(action: { }) {
                Text("NEXT")
                  .frame(width: 343, height: 56, alignment: .center)
                  .background(Color("purpleColorFromFigma"))
                  .font(.custom("Rubik-Medium", size: 17))
                  .foregroundColor(.white)
                  .cornerRadius(16)
                  .padding()
              }
              .buttonStyle(.automatic)

              Button {
                if purchased != .monthly {
                  purchased = .monthly
                }
              } label: {
                Text("Restore purchases")
                  .foregroundColor(.black)
              }
            }
          }
          .transition(.move(edge: .bottom))
        }
      }
    }
}

struct PaywallView_Previews: PreviewProvider {

  struct PaywallViewHolder: View {
    @State var show: Bool = true
    var body: some View {
      PaywallView(show: $show, purchased: .monthly)
    }
  }
  
    static var previews: some View {
      PaywallViewHolder()
    }
}
