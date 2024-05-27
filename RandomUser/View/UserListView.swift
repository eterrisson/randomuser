//
//  UserListView.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var userListVM = UserListViewModel()
    
    var body: some View {
        NavigationStack {
            switch userListVM.status {
            case .initial:
                EmptyView()
            case .error:
                ErrorListView()
            case .loading:
                ProgressView()
            case .loaded:
                ListView(userListVM: userListVM)
            }
        }
        .onAppear {
            userListVM.getList()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
