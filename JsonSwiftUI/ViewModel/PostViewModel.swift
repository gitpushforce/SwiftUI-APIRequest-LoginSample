//
//  PostViewModel.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/02.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var authenticated = 0
    
//    init() {
//        login(email: "eve.holt@reqres.in", password: "cityslicka")
//    }
    
    func login(email: String, password: String) {
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let parametros = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print (response)
            }
            
            guard let data = data else { return }
            
            do {
                let datos = try JSONDecoder().decode(PostModel.self, from: data)
                if !datos.token.isEmpty {
                    DispatchQueue.main.async {
                        print(datos.token)
                        self.authenticated = 1
                    }
                }
                
            } catch let error as NSError {
                print ("error al hacer post", error.localizedDescription)
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
            
        }.resume()
    }
}
