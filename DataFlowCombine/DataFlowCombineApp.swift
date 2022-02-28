//
//  DataFlowCombineApp.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

@main
struct DataFlowCombineApp: App {
    private let user = DataManager.shared.loadData()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserViewModel(user: user))
        }
    }
}
