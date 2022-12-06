//
//  Alerts.swift
//  tic-tac-toe-app
//
//  Created by Gabriel Santos on 28/11/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static var playerOneName: String = "Player One"
    static var playerTwoName: String = "Player Two"
    
    static let playerOneWin = AlertItem(title: Text("\(playerOneName) Win!"), message: Text("You are so smart. Congratulations \(playerOneName)."), buttonTitle: Text("Hell Yeah"))
    static let playerTwoWin = AlertItem(title: Text("\(playerTwoName) Win!"), message: Text("You are so smart. Congratulations \(playerTwoName)."), buttonTitle: Text("Hell Yeah"))
    static let humanWin = AlertItem(title: Text("You Win!"), message: Text("You are so smart. You beat your own AI."), buttonTitle: Text("Hell Yeah"))
    static let computerWin = AlertItem(title: Text("You Lost!"), message: Text("You programmed a super AI."), buttonTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw!"), message: Text("What a battle of wits we have here..."), buttonTitle: Text("Try Again"))
}
