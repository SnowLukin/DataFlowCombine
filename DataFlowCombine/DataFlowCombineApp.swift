//
//  DataFlowCombineApp.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

@main
struct DataFlowCombineApp: App {
    @StateObject private var userManager = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
