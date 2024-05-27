//
//  ContentView.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            HeaderView()
            UserListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
