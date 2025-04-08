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
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $txt)
                .keyboardType(keyboardType)
                .disableAutocorrection(true)
                .frame(height: 40)
            
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
    @Binding var isShowPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isShowPassword) {
                TextField(placeholder, text: $txt)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)
            }
            else {
                SecureField(placeholder, text: $txt)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)
            }
            
            Divider()
        }
    }
}

// O trecho abaixo (comentado) estava retornando o aviso "'@State' used inline will not work unless tagged with '@previewable'". Portanto, a comentei e inseri o trecho de código abaixo (descomentado) para que o aviso fosse resolvido

//#Preview {
//    @State var txt: String = ""
//    LineTextField(txt: $txt)
//        .padding(20)
//}

#Preview {
    LineTextFieldPreview()
}

struct LineTextFieldPreview: View {
    @State private var txt: String = ""

    var body: some View {
        LineTextField(txt: $txt)
            .padding(20)
    }
}
