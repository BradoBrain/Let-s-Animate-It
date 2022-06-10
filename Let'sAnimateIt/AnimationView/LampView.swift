//
//  LampView.swift
//  Let'sAnimateIt
//
//  Created by Artem Vinogradov on 10.06.2022.
//

import SwiftUI

struct LampView: View {
    @State var onLamp = false
    
    var body: some View {
        VStack {
            ZStack {
                LampPath()
                    .scaleEffect(0.5)
                    .foregroundColor(.yellow).opacity(onLamp ? 0.6 : 0)
                
                LampPath()
                    .scaleEffect(0.5)
                    .foregroundStyle(.ultraThinMaterial)
                
                SpringPath()
                    .stroke(onLamp ? .orange.opacity(0.7) : .black.opacity(0.1), lineWidth: 4)
                    .scaleEffect(0.4)
                
                PatrPath()
                    .foregroundColor(.black).opacity(0.6)
                    .scaleEffect(0.5)
            } .animation(.spring(response: 1, dampingFraction: 2, blendDuration: 1), value: onLamp)
            
            Button("On/Off") {
                self.onLamp.toggle()
            }
            
            
        }
    }
}

struct LampView_Previews: PreviewProvider {
    static var previews: some View {
        LampView()
    }
}

struct LampPath: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 50, y: 100))
        p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 50, y: 100))
        
        p.addCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 140, y: 350),
                   control1: CGPoint(x: UIScreen.main.bounds.width / 2 + 80, y: 200),
                   control2: CGPoint(x: UIScreen.main.bounds.width / 2 + 140, y: 300))
        
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: 500),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 + 140, y: 500))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 140, y: 350),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 - 140, y: 500))
        
        p.addCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 50, y: 100),
                   control1: CGPoint(x: UIScreen.main.bounds.width / 2 - 140, y: 300),
                   control2: CGPoint(x: UIScreen.main.bounds.width / 2 - 80, y: 200))
        
        return p
    }
}

struct SpringPath: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: 120))
        p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: 250))
        p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 60, y: 400))
        
        p.move(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: 250))
        p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 60, y: 400))
        
        p.move(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 60, y: 400))
        //p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 50, y: 400))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 40, y: 410),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 - 45, y: 410))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 30, y: 400),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 - 35, y: 410))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 20, y: 390),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 - 25, y: 390))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 10, y: 400),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 - 15, y: 390))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: 410),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 - 5, y: 410))
        
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 10, y: 400),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 + 5, y: 410))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 20, y: 390),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 + 15, y: 390))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 30, y: 400),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 + 25, y: 390))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 40, y: 410),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 + 35, y: 410))
        p.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 60, y: 400),
                       control: CGPoint(x: UIScreen.main.bounds.width / 2 + 45, y: 410))
       // p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 60, y: 400))
        
        return p
    }
}

struct PatrPath: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 50, y: 90))
        p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2 + 50, y: 90))
        
        p.addCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: -50),
                   control1: CGPoint(x: UIScreen.main.bounds.width / 2 + 50, y: -30),
                   control2: CGPoint(x: UIScreen.main.bounds.width / 2 + 40, y: -50))
        
        p.addCurve(to: CGPoint(x: UIScreen.main.bounds.width / 2 - 50, y: 90),
                   control1: CGPoint(x: UIScreen.main.bounds.width / 2 - 40, y: -50),
                   control2: CGPoint(x: UIScreen.main.bounds.width / 2 - 50, y: -30))
        
//        p.move(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: -50))
//        p.addLine(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: -80))
        return p
    }
}
