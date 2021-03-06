//
//  PlaceHolder.swift
//  DataFlowCombine
//
//  Created by Snow Lukin on 23.02.2022.
//

import SwiftUI

// Custom placeholder
// Cmon, Tim Cook, why i have to do this myself???
struct PlaceHolder<T: View>: ViewModifier {
    var placeHolder: T
    var show: Bool
    var color: Color
    var alignment: Alignment
    
    func body(content: Content) -> some View {
        ZStack(alignment: alignment) {
            if show {
                placeHolder
                    .foregroundColor(color)
            }
            content
        }
    }
}

extension View {
    func placeHolder<T:View>(_ holder: T, show: Bool, color: Color, alignment: Alignment = .leading) -> some View {
        self.modifier(PlaceHolder(placeHolder:holder, show: show, color: color, alignment: alignment))
    }
}

/*
 MARK: Usage
 
 TextField("", text: $name)
     .placeHolder(
         Text("Enter your name..."),
         show: name.isEmpty,
         color: Color("lightGray")
     )
*/
