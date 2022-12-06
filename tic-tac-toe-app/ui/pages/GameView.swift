//
//  GameView.swift
//  tic-tac-toe-app
//
//  Created by Gabriel Santos on 28/11/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    var isSinglePlayer: Bool = true
    var playerOneName: String = "Player One"
    var playerTwoName: String = "Player Two"
    
    var body: some View {
        GeometryReader { geometry in
            LinearGradient(gradient: Gradient(colors: [.blue, .red.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            VStack {
                HStack(alignment: .center, spacing: 15) {
                    VStack(spacing: 15) {
                        Text(playerOneName)
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                    .frame(width: 150, height: 120)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    
                    VStack(spacing: 15) {
                        Text(!isSinglePlayer ? playerTwoName : "Computer")
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                    .frame(width: 150, height: 120)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                }
                .padding(.top, 20)
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }.onTapGesture {
                            viewModel.processPlayerMove(for: i, isSinglePlayer: isSinglePlayer, playerOneName: playerOneName, playerTwoName: playerTwoName)
                        }
                    }
                }
                Button {
                    viewModel.resetGame()
                } label: {
                    ButtonView(title: "Resete Game", textColor: .black, backgroundColor: .white)
                        .padding(.leading, 2)
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action:  { viewModel.resetGame() }))
                
            })
        }
    }
}

enum Player {
    case playerOne, playerTwo, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .playerOne ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isSinglePlayer: false)
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.white)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.black)
    }
}
