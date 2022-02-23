//
//  ContentView.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var user: UserViewModel
    @StateObject private var timer = TimeCounterViewModel()
    
    var body: some View {
        ZStack {
            Color("darkGray")
                .ignoresSafeArea()
            VStack(spacing: 40) {
                customText("Hi, \(user.username)")
                customText("\(timer.counter)")
                Spacer()
                Spacer()
                VStack(spacing: 30) {
                    CustomButtonView(text: "\(timer.buttonTitle)", strokeColor: .orange) {
                        timer.startTimer()
                    }
                    .disabled(timer.isWaiting) // to avoid bugs
                    CustomButtonView(text: "LogOut", strokeColor: .blue) {
                        user.isRegistered.toggle()
                    }
                }
                .padding([.leading, .trailing], 40)
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserViewModel())
            .previewDevice("iPhone 13 Pro")
    }
}

extension MainView {
    
    private func customText(_ text: String) -> some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.orange)
            .offset(x: 0, y: 100)
    }
}
