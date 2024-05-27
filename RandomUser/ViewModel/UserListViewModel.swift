//
//  UserListVM.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var status: RequestStatus = .initial
    @Published var list: [User] = []
    
    let apiManager = ApiManager()
    
    enum RequestStatus {
        case initial, loading, loaded, error
    }
    
    func getList() {
        self.status = .loading
        Task {
            do {
                let result = try await apiManager.getRandomUser()
                DispatchQueue.main.async {
                    self.list = result.results
                    self.status = .loaded
                }
            } catch {
                // Gérez les erreurs ici
                print("Erreur: \(error)")
                DispatchQueue.main.async {
                    self.status = .error
                }
            }
        }
    }
}
