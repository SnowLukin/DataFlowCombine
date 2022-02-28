//
//  DataManager.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 28.02.2022.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func saveUser(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func loadData() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func clearData(userManager: UserViewModel) {
        userManager.user.username = ""
        userManager.user.isRegistered = false
        userData = nil
    }
}
