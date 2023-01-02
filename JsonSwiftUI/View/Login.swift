//
//  Login.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/02.
//

import SwiftUI

struct Login: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {

                Text("Email").foregroundColor(.white).bold()
                TextField("Email", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)


                Text("Password").foregroundColor(.white).bold()
                SecureField("Password", text: $password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    login.login(email: email, password: password)
                }){
                    Text("Entrar").foregroundColor(.white).bold()
                }
            }.padding()
            
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
