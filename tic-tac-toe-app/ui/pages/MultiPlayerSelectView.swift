//
//  MultiPlayerSelectView.swift
//  tic-tac-toe-app
//
//  Created by Gabriel Santos on 05/12/22.
//

import SwiftUI

struct MultiPlayerSelectView: View {
    @State private var playerOneName: String = ""
    @State private var playerTwoName: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .red.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            VStack {
                Text("Enter Player Names")
                    .font(.title)
                    .padding(.bottom, 50)
                    .foregroundColor(.black)
                VStack (spacing: 20) {
                    HStack {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                        TextField("Player One", text: $playerOneName)
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                    .frame(width: 350, height: 50)
                    .background(.white)
                    .foregroundColor(.white)
                    .padding(.leading, 2)
                    .cornerRadius(5)
                    HStack {
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                        TextField("Player Two", text: $playerTwoName)
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                    .frame(width: 350, height: 50)
                    .background(.white)
                    .foregroundColor(.white)
                    .padding(.leading, 2)
                    .cornerRadius(5)
                    
                    NavigationLink(destination: GameView(isSinglePlayer: false, playerOneName: !playerOneName.isEmpty ? playerOneName : "Player One", playerTwoName: !playerTwoName.isEmpty ? playerTwoName : "Player Two")) {
                        ButtonView(title: "Start Game", textColor: .white, backgroundColor: .black)
                            .padding(.leading, 2)
                            .padding(.top, 20)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MultiPlayerSelectView()
    }
}
