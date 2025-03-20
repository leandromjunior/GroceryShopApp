//
//  WelcomeView.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 27/02/25.
//

import SwiftUI
struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight) //preenche o espaço vazio na parte de baixo da tela (os métodos utilizados estão configurados no arquivo UIExtension)
            
            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text("Welcome to your grocery store")
                    .font(.system(size: 48, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 8)
                
                Text("Get your groceries faster")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    
                // Responsável por criar um link entre o botão e a view SignInView
                NavigationLink {
                    SignInView()
                } label: {
                    // Este metodo está setado no arquivo RoundButton
                    RoundButton(title: "Get Started") {
                        
                    }
                }
                
                Spacer()
                    .frame(height: 80) // Responsavel pelo espaço entre a VStack e o limite inferior da tela
            }
            .padding(.horizontal, 20) // Espaço entre as laterais do botão
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea() //Preenche a safe area com a imagem
    }
}

#Preview {
    
    NavigationView { //Responsável por fazer o redirecionamento entre as telas ao clicar no botão Get Started
        WelcomeView()
    }
    
}
