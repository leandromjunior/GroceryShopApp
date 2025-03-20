//
//  SignInView.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 16/03/25.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack{
            
            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer() // Responsável, neste contexto, por colocar a imagem no topo
            }
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea() //Preenche a safe area com a imagem
    }
}

#Preview {
    SignInView()
}
