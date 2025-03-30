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
            
            Divider()
        }
    }
}

#Preview {
    @State var txt: String = ""
    LineTextField(txt: $txt)
        .padding(20)
}
