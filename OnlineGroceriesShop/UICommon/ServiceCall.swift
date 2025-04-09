//
//  ServiceCall.swift
//  OnlineGroceriesShop
//
//  Created by Leandro Motta Junior on 08/04/25.
//

import SwiftUI
import UIKit

class ServiceCall {
    
    class func post(parameter: NSDictionary, path: String, isToken: Bool = false, withSuccess: @escaping ( (_ responseObj: AnyObject?) -> () ), failure: @escaping ( (_ error: Error?) -> () ) ) {
        
        // Inicia a execução em fila global de background para não travar a interface
        DispatchQueue.global(qos: .userInitiated).async {
            
            var parameterData = NSMutableData()
            let dictKey = parameter.allKeys as! [String] //pega todas as chaves do dicionario parameter
            
            var i = 0
            
            for dictKey in dictKey {
                // verifica se o valor é string, se for, substitui "+" por "%2B"; monta a string em formato chave=valor
                if let values = parameter.value(forKey: dictKey) as? String {
                    parameterData.append(String.init(format: "%@%@=%@", i==0 ? "" : "&", dictKey, values.replacingOccurrences(of: "+", with: "%2B")).data(using: String.Encoding.utf8)!)
                }
                // Se o valor não for String, considera que é outro tipo simples (como número ou booleano), e o converte para string usando interpolação compatível com C (CVarArg), para construir o par chave=valor.
                else{
                    parameterData.append(String.init(format: "%@%@=%@", i==0 ? "" : "&", dictKey, parameter.value(forKey: dictKey) as! CVarArg).data(using: String.Encoding.utf8)!)
                }
                
                i += 1
            }
            
            // trecho seguinte
        }
    }
    
}
