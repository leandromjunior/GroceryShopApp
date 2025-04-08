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
    @Published var showPassword: Bool = false // Se esta linha for setada como true, ao digitar a senha na tela de login, ela irá ser exibida num primeiro momento, sendo ocultada apenas se o usuário clicar no icone de olho
    
}
