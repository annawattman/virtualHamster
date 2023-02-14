//
//  playTimeView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-02-08.
//

import SwiftUI

struct playTimeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Games: ")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
                    .padding(20)
                
                
                Image("hamsterhappy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                //.centerH()
                    .padding(20)
                
                
                HStack {
                    Button(action: {}, label: {
                        NavigationLink(destination: gameOneView()) {
                            Text("Game one")
                        }
                    })
                    .foregroundColor(Color.white)
                    .frame(width: 70, height: 50)
                    .padding()
                    .background(Color.green)
                    .padding([.trailing], 10)
                    
                    
                    Button(action: {}, label: {
                        NavigationLink(destination: gameTwoView()) {
                            Text("Game two")
                        }
                    })
                            .foregroundColor(Color.white)
                            .frame(width: 70, height: 50)
                            .padding()
                            .background(Color.green)
                            .padding([.trailing], 20)
                }
            }
        }
    }
}



struct playTimeView_Previews: PreviewProvider {
    static var previews: some View {
        playTimeView()
    }
}


