//
//  RocketView.swift
//  Let'sAnimateIt
//
//  Created by Artem Vinogradov on 11.06.2022.
//

import SwiftUI

struct RocketView: View {
    @State var start = false
    @State var fireOn = false
    
    var body: some View {
        VStack {
            ZStack {
                
                RocketShadow1()
                    .foregroundColor(.gray).opacity(0.8)
                
                RocketShadow2()
                    .foregroundColor(.gray).opacity(0.4)
                
                RocketShadow3()
                    .foregroundColor(.gray).opacity(0.6)
                
                RocketWindow()
                    .foregroundStyle(.ultraThinMaterial)
                
                RocketWindow()
                    .stroke(.white, lineWidth: 2)
                
                RocketWings()
                    .foregroundColor(.red)
                
                FireRed()
                    .foregroundColor(.red)
                    .opacity(fireOn ? 1 : 0)
                    .animation(.interactiveSpring(response: 3, dampingFraction: 0.3, blendDuration: 2).delay(3), value: fireOn)
                
                FireOrange()
                    .foregroundColor(.orange)
                    .opacity(fireOn ? 1 : 0)
                    .animation(.interactiveSpring(response: 3, dampingFraction: 0.5, blendDuration: 2).delay(2), value: fireOn)
                
                FireYellow()
                    .foregroundColor(.yellow)
                    .opacity(fireOn ? 1 : 0)
                    .animation(.interactiveSpring(response: 3, dampingFraction: 0.5, blendDuration: 2).delay(0.5), value: fireOn)
            }
            .position(x: UIScreen.main.bounds.width / 2, y: start ? -200 : 550)
            .animation(.easeInOut.speed(0.2), value: start)
            
            Button(action: {
                self.start.toggle()
            }, label: {
                Text("GO")
                    .foregroundColor(.white)
                    .background(Circle().foregroundColor(.green).frame(width: 70, height: 70))
            })
            .padding()
            .opacity(fireOn ? 1 : 0)
            .animation(.easeInOut.delay(4.0), value: fireOn)
        }
            .onAppear { self.fireOn = true }
    }
}

struct RocketView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
    }
}

struct Rocket: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 196, y: 281))
        p.addQuadCurve(to: CGPoint(x: 220, y: 343), control: CGPoint(x: 220, y: 310))
        p.addQuadCurve(to: CGPoint(x: 206, y: 396), control: CGPoint(x: 217, y: 370))
        p.addLine(to: CGPoint(x: 186, y: 396))
        p.addQuadCurve(to: CGPoint(x: 172, y: 343), control: CGPoint(x: 175, y: 370))
        p.addQuadCurve(to: CGPoint(x: 196, y: 281), control: CGPoint(x: 172, y: 310))
        
        return p
    }
}

struct RocketWindow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.addArc(center: CGPoint(x: 196, y: 325), radius: 11,
                 startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
        
        return p
    }
}

struct RocketWings: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 171, y: 349))
        p.addQuadCurve(to: CGPoint(x: 168, y: 410), control: CGPoint(x: 150, y: 376))
        p.addQuadCurve(to: CGPoint(x: 180, y: 391), control: CGPoint(x: 175, y: 395))
        p.addQuadCurve(to: CGPoint(x: 171, y: 349), control: CGPoint(x: 174, y: 375))
        
        p.move(to: CGPoint(x: 221, y: 349))
        p.addQuadCurve(to: CGPoint(x: 224, y: 410), control: CGPoint(x: 242, y: 376))
        p.addQuadCurve(to: CGPoint(x: 212, y: 391), control: CGPoint(x: 217, y: 395))
        p.addQuadCurve(to: CGPoint(x: 221, y: 349), control: CGPoint(x: 218, y: 375))
        
        
        return p
    }
}

struct RocketShadow1: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 196, y: 281))
        p.addQuadCurve(to: CGPoint(x: 220, y: 343), control: CGPoint(x: 220, y: 310))
        p.addQuadCurve(to: CGPoint(x: 206, y: 396), control: CGPoint(x: 217, y: 370))
        p.addLine(to: CGPoint(x: 200, y: 396))
        p.addQuadCurve(to: CGPoint(x: 207, y: 343), control: CGPoint(x: 206, y: 370))
        p.addQuadCurve(to: CGPoint(x: 196, y: 281), control: CGPoint(x: 211, y: 310))
        
        return p
    }
}

struct RocketShadow2: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 196, y: 281))
        p.addQuadCurve(to: CGPoint(x: 172, y: 343), control: CGPoint(x: 172, y: 310))
        p.addQuadCurve(to: CGPoint(x: 186, y: 396), control: CGPoint(x: 175, y: 370))
        p.addLine(to: CGPoint(x: 192, y: 396))
        p.addQuadCurve(to: CGPoint(x: 185, y: 343), control: CGPoint(x: 186, y: 370))
        p.addQuadCurve(to: CGPoint(x: 196, y: 281), control: CGPoint(x: 181, y: 310))
        
        return p
    }
}

struct RocketShadow3: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 196, y: 281))
        p.addQuadCurve(to: CGPoint(x: 207, y: 343), control: CGPoint(x: 211, y: 310))
        p.addQuadCurve(to: CGPoint(x: 200, y: 396), control: CGPoint(x: 206, y: 370))
        p.addLine(to: CGPoint(x: 192, y: 396))
        p.addQuadCurve(to: CGPoint(x: 185, y: 343), control: CGPoint(x: 186, y: 370))
        p.addQuadCurve(to: CGPoint(x: 196, y: 281), control: CGPoint(x: 181, y: 310))
        
        return p
    }
}

struct FireYellow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 201, y: 400))
        p.addLine(to: CGPoint(x: 191, y: 400))
        p.addQuadCurve(to: CGPoint(x: 196, y: 413), control: CGPoint(x: 192, y: 406))
        p.addQuadCurve(to: CGPoint(x: 201, y: 400), control: CGPoint(x: 200, y: 406))
        
        return p
    }
}

struct FireOrange: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 201, y: 400))
        p.addLine(to: CGPoint(x: 191, y: 400))
        p.addQuadCurve(to: CGPoint(x: 196, y: 450), control: CGPoint(x: 189, y: 423))
        p.addQuadCurve(to: CGPoint(x: 201, y: 400), control: CGPoint(x: 203, y: 423))
        
        return p
    }
}

struct FireRed: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 203, y: 400))
        p.addLine(to: CGPoint(x: 189, y: 400))
        p.addQuadCurve(to: CGPoint(x: 196, y: 483), control: CGPoint(x: 184, y: 440))
        p.addQuadCurve(to: CGPoint(x: 203, y: 400), control: CGPoint(x: 208, y: 440))
        
        return p
    }
}
