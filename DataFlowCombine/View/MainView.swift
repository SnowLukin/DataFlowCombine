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
                Spacer()
                greetingText
                timerText
                buttons
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
            .previewDevice("iPhone SE (2nd generation)")
    }
}

extension MainView {
    private var greetingText: some View {
        Text("Hi, \(user.username)")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.orange)
    }
    
    private var timerText: some View {
        Text("\(timer.counter)")
            .font(.system(size: UIScreen.main.bounds.height / 3))
            .fontWeight(.semibold)
            .foregroundColor(.orange)
    }
    
    private var buttons: some View {
        VStack(spacing: 30) {
            CustomButtonView(text: "\(timer.buttonTitle)", strokeColor: .orange) {
                timer.startTimer()
            }
            .disabled(timer.isWaiting) // to avoid bugs
            CustomButtonView(text: "LogOut", strokeColor: .blue) {
                user.isRegistered.toggle()
            }
        }
    }
}
