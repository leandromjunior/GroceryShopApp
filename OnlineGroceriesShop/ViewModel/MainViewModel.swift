//
//  MainViewModel.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 30/03/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = true // O botão de exibição da senha (olho) só apareceu após eu setar esta variavel para true e no arquivo LineTextField, na struct LineSecureField fazer a verificação !isShowPassword
    
}
