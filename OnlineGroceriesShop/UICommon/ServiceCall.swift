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
            
            // Cria um URLRequest com a url fornecida em path e que se a requisição não for concluida em 20 segundos, será cancelada
            var request = URLRequest(url: URL(string: path)!, timeoutInterval: 20)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            // Confirma que é uma requisição do tipo POST
            request.httpMethod = "POST"
            // O corpo (httpBody) contém os parâmetros serializados que você construiu antes (com parameterData)
            request.httpBody = parameterData as Data
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                    // Tratando erro da requisição
                if let error = error {
                    DispatchQueue.main.async {
                        failure(error)
                    }
                } else {
                    
                    // Tratando o sucesso da requisição
                    if let data = data {
                        do {
                            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                            
                            DispatchQueue.main.async {
                                withSuccess(jsonDictionary)
                            }
                            
                            
                        }
                        catch {
                            DispatchQueue.main.async {
                                failure(error)
                            }
                        }
                    }
                }
                
            }
                
        }
    }
    
}
