//
//  ContentView.swift
//  heComes
//
//  Created by ST SE on 14/3/2023.
//

import SwiftUI
import Sword

struct ContentView: View {
    
    //discord bot token
    let bot = Sword(token: "add token here!")
    let date = Date()
    let df = DateFormatter()
    
    init(){
        df.dateFormat = "yyyy-MM-dd HH:mm"
        
        bot.editStatus(to: "playing", playing: "chrome")
        
        bot.on(.messageCreate) { data in
            //Requires a backend server
        var msg = data as! Message
        switch Commands(rawValue: msg.content) {
        case .hello?:
            msg.reply(with: "hello!")
        case .back?:
            msg.reply(with: "GoBack GoBack!")
        default:
            break
        }
            
    }

    bot.on(.ready) { data in
        let user = data as! User
        print("\n\t\(user.username ?? "Bot") says 'Hello there!'\n")
    }

    bot.connect()
    }

    var body: some View {
        ZStack{
            
            Color(red: 181/255, green: 208/255, blue: 237/255)
                .ignoresSafeArea(.all)
            HStack(spacing: 30){
                
                
                VStack() {
                    
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 170, height: 250)
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        .overlay(
                            
                            Button(action: {
                                bot.send("老母不在 " + df.string(from: date), to: 1085133432193036358)
                                
                            }) {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 150, height: 150)
                                    .overlay(Text("老母 Good")
                                        .foregroundColor(.white)
                                        .font(.headline))
                                
                                
                            }
                                .shadow(color: .gray, radius: 5, x: 0, y: 4)
                            
                            
                        )
                        .offset(y:-100)
                    
                    
                    
                }
                
                
                
                VStack(){
                    
                    
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 170, height: 250)
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        .overlay(
                            
                            Button(action: {
                                bot.send("老母黎咗 " + df.string(from: date), to: 1085133432193036358)
                            }) {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 150, height: 150)
                                    .overlay(Text("老母黎咗 Bad")
                                        .foregroundColor(.white)
                                        .font(.headline))
                            }
                                .shadow(color: .gray, radius: 5, x: 0, y: 4)
                        )
                        .offset(y:-100)
                    
                }
            }
            VStack{
                Spacer()
                Image("image1")
                    .resizable()
                    .shadow(color: .black, radius: 5, x: 0, y: 4)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
