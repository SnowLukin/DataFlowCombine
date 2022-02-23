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
    
    @FocusState private var focusedField: Bool
    
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
                    // remove suggestions for keyboard
                    .disableAutocorrection(true)
                    .keyboardType(.alphabet)
                Text("Characters left to login: \(isValid ? 0 : 3 - username.count)")
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
            .focused($focusedField)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedField = false
                    }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RegisterView()
        }
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
