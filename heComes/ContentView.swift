//
//  ContentView.swift
//  heComes
//
//  Created by ST SE on 14/3/2023.
//

import SwiftUI
import Sword

struct ContentView: View {
    
    @State var isTrue = true
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
        VStack {
            Button(action: {
                isTrue.toggle()
                if(isTrue){
                    // modify to your channel id
                    bot.send("老母不在 " + df.string(from: date), to: 1085133432193036358)
                } else{
                    
                    bot.send("老母黎咗 " + df.string(from: date), to: 1085133432193036358)
                }
                
                    }) {
                        Circle()
                            .fill(isTrue ? Color.green : Color.red)
                            .frame(width: 200, height: 200)
                            .overlay(Text(isTrue ? "老母不在 Good" : "老母黎咗 Bad")
                                        .foregroundColor(.white)
                                        .font(.headline))
                            .shadow(color: .gray, radius: 5, x:0, y:2)
                    }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
