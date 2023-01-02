//
//  Home.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/02.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        NavigationView {
            Text("Bienvenido!")
                .navigationTitle("JSON")
                .navigationBarItems(leading:
                                        
                                        Button(action: {
                                            UserDefaults.standard.removeObject(forKey: "session")
                                            login.authenticated = 0
                                        }){
                                            Text("Salir")
                                        }, trailing: Button(action: {
                    
                                        }){
                                            Text("Siguiente")
                                        })
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
