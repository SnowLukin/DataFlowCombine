//
//  StarterView.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        Group {
            if user.isRegistered {
                MainView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserViewModel())
    }
}
