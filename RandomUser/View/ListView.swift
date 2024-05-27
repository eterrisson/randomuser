//
//  ListView.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var userListVM: UserListViewModel
    
    //let list: [User]
    
    var body: some View {
        VStack {
            List {
                ForEach(userListVM.list) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        Text(user.name.description)
                    }
                    
                }
            }
            .refreshable {
                userListVM.getList()
            }
        }
    }
}
