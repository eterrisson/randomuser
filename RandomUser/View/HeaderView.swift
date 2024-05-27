//
//  HeaderView.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.cyan)
                Image(systemName: "person.fill")
                    .foregroundColor(.pink)
                Image(systemName: "person.fill.turn.down")
                    .foregroundColor(.green)
            }
            Text("Random User")
                .foregroundColor(.gray)
        }
        .font(.title)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
