//
//  RoundButton.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 16/03/25.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didClick: (()->())?
    var body: some View {
        Button {
            didClick?()
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.primaryApp)
        .cornerRadius(20)
    }
}

#Preview {
    RoundButton()
        .padding(20)
}
