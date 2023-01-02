//
//  Home.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/02.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login : PostViewModel
    @StateObject var json = Model1ViewModel()
    
    var body: some View {
        NavigationView {
            if json.datosModelo.isEmpty {
                ProgressView()
            } else {
                List(json.datosModelo, id:\.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.email)
                        Text(item.address.geo.lat)
                    }
                }.navigationBarTitle("JSON")
                .navigationBarItems(leading:
                                       Button(action: {
                                           UserDefaults.standard.removeObject(forKey: "session")
                                           login.authenticated = 0
                                       }){
                                           Text("Salir")
                                       }, trailing: Button(action: {
                   
                                       }){
                                           Text("Siguiente")
                                       }
                                    )
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
