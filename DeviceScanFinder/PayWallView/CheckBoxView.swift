//
//  CheckBoxView.swift
//  DeviceScanFinder
//
//  Created by Николай Никитин on 12.09.2023.
//

import SwiftUI

// MARK: - Purchase Options Enum
enum PurchaseOptions: String, CaseIterable {

  case weekly, monthly, permanently

  var price: String {
    switch self {
    case .weekly:
      return "3,6$ / week"
    case .monthly:
      return "7,05 / month"
    case .permanently:
      return "12,00$ / permanently"
    }
  }
}

struct CheckBoxView: View {

  // MARK: - Dependencies
  @Binding var checked: PurchaseOptions

  // MARK: - Body
  var body: some View {

      VStack {
        ForEach(PurchaseOptions.allCases, id: \.rawValue) { purchase in
          HStack {
            ZStack {
              Circle()
                .foregroundColor(checked == purchase ? Color("activeColor") : Color("unactiveColor") )
                .frame(width: 8, height: 8)
            }

            HStack {
              Text("\(purchase.rawValue.capitalized)")
                .font(.custom(checked == purchase ? "Rubik-Medium" : "Rubik-Regular", size: 15))
                .padding()
                .frame(alignment: .leading)
            }
            HStack {
              Text("\(purchase.price)")
                .font(.custom(checked == purchase ? "Rubik-Medium" : "Rubik-Regular", size: 15))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .trailing)

            }
          }
          .padding(.leading, 16)
          .padding(.trailing, 8)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color("unactiveColor"), lineWidth: 2)
          )
          .onTapGesture {
            self.checked = purchase
          }
        }
      }
    .padding()
  }
}

struct CheckBoxView_Previews: PreviewProvider {
  struct CheckBoxViewHolder: View {
    @State var checked: PurchaseOptions = .monthly

      var body: some View {
          CheckBoxView(checked: $checked)
      }
  }

  static var previews: some View {
    CheckBoxViewHolder()
  }
}
