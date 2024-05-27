//
//  ApiManager.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import Foundation
import Alamofire

/// Manage API with Alamofire
///
class ApiManager {
    
    let urlString: String = "https://randomuser.me/api/?results=20"
    let maxUsersPerRequest: Int = 20
    
    func getRandomUser() async throws -> ApiResult {
        do {
            return try await AF.request(self.urlString).serializingDecodable(ApiResult.self).value
        } catch {
            throw error
        }
    }
}
