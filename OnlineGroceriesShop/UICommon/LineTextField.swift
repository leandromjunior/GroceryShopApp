//
//  LineTextField.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 30/03/25.
//

import SwiftUI

struct LineTextField: View {
    @Binding var txt: String
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @State var keyboardType: UIKeyboardType = .default
    @State var isPassword: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isPassword) {
                SecureField(placeholder, text: $txt)
            }
            else {
                TextField(placeholder, text: $txt)
                    .keyboardType(keyboardType)
            }

            
            Divider()
        }
    }
}
//retomar a partir do codigo abaixo
struct LineSecureField: View {
    @Binding var txt: String
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @State var keyboardType: UIKeyboardType = .default
    @Binding var isPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (!isPassword) {
                TextField(placeholder, text: $txt)
                    .modifier(ShowButton(isShow: $isPassword))
            }
            else {
                SecureField(placeholder, text: $txt)
                    .modifier(ShowButton(isShow: $isPassword))
            }
            
            Divider()
        }
    }
}

#Preview {
    @State var txt: String = ""
    LineTextField(txt: $txt)
        .padding(20)
}
