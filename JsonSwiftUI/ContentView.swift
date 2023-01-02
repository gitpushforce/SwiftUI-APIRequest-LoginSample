//
//  ContentView.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login : PostViewModel
    
    // login sample from reqres.in (site to test API requests)
    // email: eve.holt@reqres.in
    // password : cityslicka
    
    var body: some View {
        Group {
            if login.authenticated == 0 {
                Login()
            } else if login.authenticated == 1 {
                Home()
            } else if login.authenticated == 2 {
                VStack {
                    Text("Usuario y/o password incorrectos")
                    Button(action: {
                        login.authenticated = 0
                    }){
                        Text("Regresar")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
