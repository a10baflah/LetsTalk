//
//  ContentView.swift
//  LetsTalk
//
//  Created by Shreyaan Arora on 11/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15){
                Image("Logo")
                    .resizable()
                    .frame(width: 100.0, height: 105.0)
                    .foregroundColor(.accentColor)
                    .padding()
                Text("LetsTalk")
                
//                Spacer()
                
                Button(action: {
                    
                })  {
                    Text("Join")
                        .fontWeight(.bold)
                        .font(.system(size: 25.0))
                        .foregroundColor(.accentColor)
                }
            .padding()
            .padding()
            .padding()
                Button(action: {
                
            })  {
                Image("logIn")
                    .resizable()
                    .frame(width: 280.0, height: 90.0)
                    .foregroundColor(.accentColor)
            }
        }.background(Color("backgroundColor"))
        
    }
        
//        Spacer()
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Welcome : View {
    
    var body: some View
    {
        VStack(spacing: 10){
            
            HStack{
                Text("Lsd")
            }
        }
    }
}
