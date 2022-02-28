//
//  RegisterView.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @FocusState private var focusedField: Bool
    
    private var isValid: Bool {
        userViewModel.user.username.count >= 3
    }
    
    var body: some View {
        
        ZStack {
            Color("darkGray")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                textField
                charToLoginText
                Spacer()
                loginButton
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
    
    private var textField: some View {
        TextField("", text: $userViewModel.user.username)
            .font(.title2)
            .foregroundColor(.orange)
            .placeHolder(
                Text("Enter your name...").font(.title2),
                show: userViewModel.user.username.isEmpty,
                color: Color("lightGray"),
                alignment: .center
            )
            .multilineTextAlignment(.center)
            // remove suggestions for keyboard
            .disableAutocorrection(true)
            .keyboardType(.alphabet)
    }
    
    private var charToLoginText: some View {
        Text("Characters left to login: \(isValid ? 0 : 3 - userViewModel.user.username.count)")
            .font(.title3)
            .foregroundColor(Color("lightGray"))
            .multilineTextAlignment(.center)
    }
    
    private var loginButton: some View {
        CustomButtonView(text: "LogIn", strokeColor: .blue) {
            userViewModel.user.isRegistered.toggle()
            DataManager.shared.saveUser(user: userViewModel.user)
        }.padding()
            .disabled(!isValid)
            .opacity(isValid ? 1 : 0.4)
    }
    
}
