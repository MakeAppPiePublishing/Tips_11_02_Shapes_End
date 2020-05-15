//
//  ContentView.swift
//  Shapes
//
//  Created by Steven Lipton on 5/11/20.
//  Copyright © 2020 Steven Lipton. All rights reserved.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 11 (Q3 2020) video 06
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Learn how to use the basic shapes of SwiftUI 
//  For more code, go to http://bit.ly/AppPieGithub

import SwiftUI

struct ContentView:View {
    @State var index = 0
    var variedColor:Color{
        index % 2 == 0 ? .yellow : .clear
    }
    func aspectHeight(_ geometry:GeometryProxy)->CGFloat{
        geometry.size.width * (1.0 / 3.0)
    }
    
    var body: some View{
        GeometryReader{geometry in
            VStack{
                Text("Shapes demo")
                    .font(.largeTitle)
                Spacer()
                HStack{
                    ZStack {
                        Circle().fill(Color.yellow)
                        Image(systemName:"\(self.index).square.fill")
                            .resizable()
                        
                    }
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.yellow, lineWidth: 10)
                        )
                            .frame(width:geometry.size.width * 0.25 , height:geometry.size.width * 0.25)
                            .padding(.leading,geometry.size.width * 0.1)
                   
                    Text(NumberFormatter.localizedString(from: NSNumber(integerLiteral: self.index), number: .spellOut).capitalized)
                        .font(.largeTitle)
                    Spacer()
                    Circle().fill(self.variedColor)
                       // .border(Color.black, width: 5)
                        .frame(width:self.aspectHeight(geometry))
                    }//HStack
                        .frame(width:geometry.size.width, height:self.aspectHeight(geometry))
                    .background(Capsule().fill(Color.blue))
                        .onTapGesture {
                            self.index = (self.index + 1) % 50
                        }//tap
                        .onLongPressGesture {
                            self.index = 0
                        }//longpress
                Spacer()
            }//Vstack
        }//Geometry
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
