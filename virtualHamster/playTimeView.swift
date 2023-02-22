//
//  playTimeView.swift
//  virtualHamster
//
//  Created by Anna Wattman on 2023-02-08.
//

import SwiftUI

struct playTimeView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    Button(action: {
                        print("Button tapped")
                        self.presentation.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Go Back")
                            .font(.system(size: 16))
                            .padding(8)
                    })
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.leading, 20)
                    .padding(.top, 5)
                    .navigationBarBackButtonHidden(true)
                    
                    
                    //  Spacer()
                    
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
}



struct playTimeView_Previews: PreviewProvider {
    static var previews: some View {
        playTimeView()
    }
}


