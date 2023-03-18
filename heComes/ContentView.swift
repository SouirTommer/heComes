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
    @State private var presentAlert = false
    
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
        NavigationView {
            
            
            ZStack{
                
                Color(red: 181/255, green: 208/255, blue: 237/255)
                    .ignoresSafeArea(.all)
                VStack(){
                    HStack(alignment: .top){
                        Spacer()
                        Button(action:{
                            
                            print("hi")
                        }){
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                            
                        }
                        .foregroundColor(Color.white)
                        .padding(.trailing, 15)
                        .padding(.top, 5)
                        
                    }//.border(Color.green)
                    Spacer()
                }//.border(Color.black)
                
                HStack(spacing: 30){
                    
                    
                    
                    VStack() {
                        
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 170, height: 250)
                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
                            .overlay(
                                
                                Button(action: {
                                    bot.send("老母不在 " + df.string(from: date), to: 1085133432193036358)
                                    presentAlert = true
                                    
                                }) {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 150, height: 150)
                                        .overlay(Text("老母黎咗 Good")
                                            .foregroundColor(.white)
                                            .font(.headline))
                                    
                                    
                                }
                                    .shadow(color: .gray, radius: 5, x: 0, y: 4)
                                    .buttonStyle(ClickEffectButtonStyle())
                                    .alert("幫你Discord call咗啦", isPresented: $presentAlert, actions: {})
                                
                                
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
                                    presentAlert = true
                                }) {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 150, height: 150)
                                        .overlay(Text("老母黎咗 Bad")
                                            .foregroundColor(.white)
                                            .font(.headline))
                                }
                                    .shadow(color: .gray, radius: 5, x: 0, y: 4)
                                    .buttonStyle(ClickEffectButtonStyle())
                                    .alert("幫你Discord call咗啦", isPresented: $presentAlert, actions: {})
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
                
            }//.border(Color.red)
        }
    }
}
struct ClickEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
