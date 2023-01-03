//
//  DetailView.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/03.
//

import SwiftUI

struct DetailView: View {
    
    var id : Int
    @StateObject var user = DetailViewModel()
    
    var body: some View {
        VStack {
            
            // image takes time to load so it will throw an error if is not loaded on time.
            // that's why we should use this if statement with ProgressView()
            if user.avatar.isEmpty {
                ProgressView()
            } else {
                Image(systemName: "persona.fill")
                    .data(url: URL(string: user.avatar)!)
                    .frame(width: 80, height: 80)
                    .clipped()
                    .clipShape(Circle())
                Text(user.first_name).font(.largeTitle)
                Text(user.email).font(.title)
            }
        }.onAppear {
            user.fetch(id: id)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id : 1)
    }
}
