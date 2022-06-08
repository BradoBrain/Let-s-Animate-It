//
//  AppearMenu.swift
//  Let'sAnimateIt
//
//  Created by Artem Vinogradov on 06.06.2022.
//

import SwiftUI

struct AppearMenu: View {
    @State var onTap = false
    @State var place1 = 0
    @State var place2 = 30
    @State var place3 = 60
    @State var place4 = 90
    
    var body: some View {
        ZStack {
            
            Image(systemName: "phone.circle")
                .foregroundColor(.mint)
                .font(.largeTitle)
                .offset(x: -100, y: 0)
                .rotationEffect(Angle(degrees: onTap ? Double(place1) : 240))
                .animation(.interactiveSpring(response: 2, dampingFraction: 0.7, blendDuration: 1), value: onTap)
                .opacity((0 <= place4 && place4 < 180 ) ? 1 : 0)
            
            Image(systemName: "message.circle")
                .foregroundColor(.indigo)
                .font(.largeTitle)
                .offset(x: -100, y: 0)
                .rotationEffect(Angle(degrees: onTap ? Double(place2) : 270))
                .animation(.interactiveSpring(response: 2, dampingFraction: 0.7, blendDuration: 1), value: onTap)
                .opacity((0 <= place4 && place4 < 180 ) ? 1 : 0)
                
            Image(systemName: "envelope.circle")
                .foregroundColor(.purple)
                .font(.largeTitle)
                .offset(x: -100, y: 0)
                .rotationEffect(Angle(degrees: onTap ? Double(place3) : 300))
                .animation(.interactiveSpring(response: 2, dampingFraction: 0.7, blendDuration: 1), value: onTap)
                .opacity((0 <= place4 && place4 < 180 ) ? 1 : 0)
            
            Image(systemName: "waveform.circle")
                .foregroundColor(.purple)
                .font(.largeTitle)
                .offset(x: -100, y: 0)
                .rotationEffect(Angle(degrees: onTap ? Double(place4) : 330))
                .animation(.interactiveSpring(response: 2, dampingFraction: 0.7, blendDuration: 1), value: onTap)
                .opacity((0 <= place4 && place4 < 180 ) ? 1 : 0)
            
            
            
            
            
            
            
            Button(action: { self.onTap.toggle()
                if onTap == true {
                    place1 = 0
                    place2 = 30
                    place3 = 60
                    place4 = 90
                } else {
                    place1 = 240
                    place2 = 270
                    place3 = 300
                    place4 = 330
                }
                
            }, label: {
                ZStack {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 70, height: 70)
                    
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            })
        }
    }
}

struct AppearMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppearMenu()
    }
}
