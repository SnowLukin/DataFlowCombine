//
//  UserManager.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
}
