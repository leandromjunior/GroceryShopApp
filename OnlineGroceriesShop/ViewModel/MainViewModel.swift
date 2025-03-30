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
    @Published var isShownPassword: Bool = false
    
}
