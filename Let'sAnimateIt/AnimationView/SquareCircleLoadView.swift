//
//  SquareCircleLoadView.swift
//  Let'sAnimateIt
//
//  Created by Artem Vinogradov on 09.06.2022.
//

import SwiftUI

struct SquareCircleLoadView: View {
    @State var trigger = false
    @State var changeOffset: CGFloat = 20
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 2) {
                
                HStack(spacing: 2) {
                    RoundedRectangle(cornerRadius: trigger ? 25 : 0)
                        .frame(width: 50, height: 50)
                        .foregroundColor(trigger ? .green : .mint)
                        .offset(x: trigger ? -changeOffset : 0, y: trigger ? -changeOffset : 0)
                    RoundedRectangle(cornerRadius: trigger ? 25 : 0)
                        .frame(width: 50, height: 50)
                        .foregroundColor(trigger ? .orange : .purple)
                        .offset(x: trigger ? changeOffset : 0, y: trigger ? -changeOffset : 0)
                }
                
                HStack(spacing: 2) {
                    RoundedRectangle(cornerRadius: trigger ? 25 : 0)
                        .frame(width: 50, height: 50)
                        .foregroundColor(trigger ? .mint : .indigo)
                        .offset(x: trigger ? -changeOffset : 0, y: trigger ? changeOffset : 0)
                    RoundedRectangle(cornerRadius: trigger ? 25 : 0)
                        .frame(width: 50, height: 50)
                        .foregroundColor(trigger ? .pink : .cyan)
                        .offset(x: trigger ? changeOffset : 0, y: trigger ? changeOffset : 0)
                }
                
            }
            .opacity(trigger ? 0.7 : 0.9)
            .rotationEffect(Angle(degrees: trigger ? 360 : 0))
            .animation(trigger ? .interactiveSpring(response: 0.7, dampingFraction: 1, blendDuration: 10).repeatForever() : .easeOut(duration: 0.5), value: trigger)
            
            Spacer()
            
            Button("Make a magic") {
                self.trigger.toggle()
            }
        }
    }
}

struct SquareCircleLoadView_Previews: PreviewProvider {
    static var previews: some View {
        SquareCircleLoadView()
    }
}
