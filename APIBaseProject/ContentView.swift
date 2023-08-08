//
//  ContentView.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 7/8/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: GitHubUser?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(user?.login ?? "Hello")
                .task {
                    user = try? await ExampleAPIService.getGitHubUserInfo(by: "markzhangdev")
                    
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
