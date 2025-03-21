//
//  SignInView.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 16/03/25.
//

import SwiftUI

struct SignInView: View {
    
    @State var txtMobile: String = ""
    
    var body: some View {
        ZStack{
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer() // Responsável, neste contexto, por colocar a imagem no topo
            }
            
            ScrollView{
                
                VStack(alignment: .leading){
                    Text("Get Your Groceries")
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    HStack{
                        Button {
                            
                        } label: {
                            Image("")
                            
                            Text("+55")
                                .font(.system(size: 26, weight: .medium))
                                .foregroundColor(.primaryText)
                        }
                        
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)

                    }
                    
                    Divider()
                        .padding(.bottom, 25)
                        
                    Text("Or connect with social media")
                        .font(.system(size: 20, weight: .thin))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 25)
                    
                    Button {
                        
                    } label: {
                        
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 25)
                        Text("Continue with Google")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 5)
                    
                    Button {
                        
                    } label: {
                        
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 25)
                        Text("Continue with Facebook")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "4A66AC"))
                    .cornerRadius(20)
                }
            }
            .padding(.horizontal, 20)
            .frame(width: .screenWidth, alignment: .leading)
            .padding(.top, .topInsets + .screenWidth)
            
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
