//
//  ButtonView.swift
//  tic-tac-toe-app
//
//  Created by Gabriel Santos on 05/12/22.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 350, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
