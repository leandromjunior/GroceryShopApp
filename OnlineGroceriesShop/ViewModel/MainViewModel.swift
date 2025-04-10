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
    
    @Published var showError = false // Controla se a view deve receber um alerta de erro
    @Published var errorMessage = "" // Mensagem de eerro
    
    // MARK: ServiceCall
    
    func serviceLogin() {
        
        // Enviando os dados de email e senha como parametro
        ServiceCall.post(parameter: ["email": txtEmail, "password": txtPassword], path: Globs.SV_LOGIN) {responseObj in
            
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response)
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                }
                else {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
                
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
        
    }
}
