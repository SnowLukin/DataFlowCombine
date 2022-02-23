//
//  RegisterView.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: UserViewModel
    
    @State private var username = ""
    
    private var isValid: Bool {
        username.count >= 3
    }
    
    var body: some View {
        
        ZStack {
            Color("darkGray")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                TextField("", text: $username)
                    .font(.title2)
                    .foregroundColor(.orange)
                    .placeHolder(
                        Text("Enter your name...").font(.title2),
                        show: username.isEmpty,
                        color: Color("lightGray"),
                        alignment: .center
                    )
                    .multilineTextAlignment(.center)
                Text("Username must contain at least 3 characters.")
                    .font(.title3)
                    .foregroundColor(Color("lightGray"))
                    .multilineTextAlignment(.center)
                Spacer()
                CustomButtonView(text: "LogIn", strokeColor: .blue) {
                    registerUser()
                }.padding()
                    .disabled(!isValid)
                    .opacity(isValid ? 1 : 0.4)
                Spacer()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    private func registerUser() {
        if !username.isEmpty {
            user.username = username
            user.isRegistered.toggle()
        }
    }
}
