//
//  UserManager.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import Combine
import SwiftUI

class UserViewModel: ObservableObject {
    @AppStorage("username") var username = ""
    @AppStorage("isRegistered") var isRegistered = false
}
