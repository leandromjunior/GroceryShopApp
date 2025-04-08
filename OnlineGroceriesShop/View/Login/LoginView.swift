//
//  LoginView.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 29/03/25.
//

import SwiftUI

struct LoginView: View {
    
    // Acessa o modo de apresentação da tela
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared
    
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            //VStack responsável pela logo e pelos campos de email e senha
            VStack{
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                    .padding(.bottom, .screenWidth * 0.1)
                
                Text("Login")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your email and password")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(txt: $loginVM.txtEmail, title: "Email", placeholder: "Enter your email", keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.06)
                
                LineSecureField(txt: $loginVM.txtPassword, title: "Password", placeholder: "Enter your password", isShowPassword: $loginVM.showPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                Button {
                    
                } label: {
                    Text("Forgot your password?")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.primaryText)
                        
                }
                .frame(minWidth:0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundButton(title: "Log In") {}
                    .padding(.bottom, .screenWidth * 0.03)
                
                HStack {
                    
                    Text("Don't have an account?")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.primaryText)
                    
                    Text("Sign Up")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.primaryApp)
                }
                
                
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            
            VStack{
                
                HStack{
                    Button {
                        //Fecha a tela ao clicar no botão em questão
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    // Espaço para distanciar o botão do centro horizontalmente (para a esquerda)
                    Spacer()

                }
                
                // Espaço para distanciar o botão do centro verticalmente (para cima)
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea() //Preenche a safe area com a imagem
    }
}

#Preview {
    LoginView()
}
