//
//  ContentView.swift
//  HackerNews
//
//  Created by Andrei Toni Niculae on 11.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("HackerNews")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}



//let posts = [
//Post(id: "1", title: "Hello"),
//Post(id: "2", title: "Bonjour"),
//Post(id: "3", title: "Hola")
//]

#Preview {
    ContentView()
}
