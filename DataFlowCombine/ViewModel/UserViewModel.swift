//
//  UserManager.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 24.02.2022.
//

import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var user = User()
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

