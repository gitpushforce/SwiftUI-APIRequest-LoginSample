//
//  Model2ViewModel.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/03.
//

import Foundation

class Model2ViewModel: ObservableObject {
    @Published var datosModelo = Model2(data: [])
    
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }
        
        URLSession.shared.dataTask(with: url) { data,_,_ in
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(Model2.self, from: data)
                DispatchQueue.main.async {
                    self.datosModelo = json
                }
            } catch let error as NSError{
                print("Error en el json", error.localizedDescription)
            }
        }.resume()
    }
}
