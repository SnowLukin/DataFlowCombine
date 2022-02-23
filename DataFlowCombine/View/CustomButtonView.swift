//
//  CustomButtonView.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

struct CustomButtonView: View {
    
    var text: String
    var strokeColor: Color
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("darkGray"))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color("lightGray"))
                .cornerRadius(20)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(strokeColor, lineWidth: 4)
        )
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("darkGray")
                .ignoresSafeArea()
            CustomButtonView(text: "Text", strokeColor: .orange, action: {})
        }
    }
}
