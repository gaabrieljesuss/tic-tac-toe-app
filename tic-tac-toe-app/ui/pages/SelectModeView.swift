//
//  SelectModeView.swift
//  tic-tac-toe-app
//
//  Created by Gabriel Santos on 05/12/22.
//

import SwiftUI

struct SelectModeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .red.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
                VStack {
                    Text("Tic Tac Toe")
                        .font(.custom("Arial", size: 60))
                        .padding(.top, 20)
                    HStack {
                        VStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.black)
                                .padding()
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.black)
                                .padding()
                        }
                        VStack {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .bottom)
                                .foregroundColor(.black)
                                .padding()
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .bottom)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .padding(.top, 30)
                    
                    VStack(spacing: 15) {
                        NavigationLink(destination: GameView(isSinglePlayer: true)) {
                            ButtonView(title: "Single Player", textColor: .black, backgroundColor: .white)
                                .padding(.leading, 2)
                        }.foregroundColor(.black)
                        NavigationLink(destination: MultiPlayerSelectView()) {
                            ButtonView(title: "MultiPlayer", textColor: .white, backgroundColor: .black)
                                .padding(.leading, 2)
                        }
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                }
            }
        }
        .accentColor(.black)
    }
}

struct SelectModeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectModeView()
    }
}
