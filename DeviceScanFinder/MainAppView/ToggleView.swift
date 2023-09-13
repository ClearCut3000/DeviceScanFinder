//
//  ToggleView.swift
//  DeviceScanFinder
//
//  Created by Николай Никитин on 12.09.2023.
//

import SwiftUI

/// Toogle Bluetooth Swich custom View on MainAppView
struct ToggleView: View {

  // MARK: - Dependencies
  @Binding var isSwitchOn: Bool

  // MARK: - View Body
  var body: some View {
    Button(action: {
      withAnimation(.easeInOut(duration: 0.5)) {
        isSwitchOn.toggle()
      }
    }) {
      ZStack {
        Capsule()
          .frame(width: 84, height: 44)
          .foregroundColor(isSwitchOn ? Color("unactiveColor") : Color("activeColor"))

        Image("BluetoothToggleIcon")
          .resizable()
          .frame(width: 36, height: 36)
          .offset(x: isSwitchOn ? 20 : -20, y: 0)
      }
    }
  }
}

struct ToggleView_Previews: PreviewProvider {
  struct ToggleViewHolder: View {
    @State var isOn: Bool = false
    var body: some View {
      ToggleView(isSwitchOn: $isOn)
    }
  }

  static var previews: some View {
    ToggleViewHolder()
  }
}
