//
//  DoorView.swift
//  Let'sAnimateIt
//
//  Created by Artem Vinogradov on 06.06.2022.
//

import SwiftUI

struct DoorView: View {
    @State var onTap = false
    @State var insertX = 0.0
    @State var color: Color = .gray
    @State var showText: Double = 0
    
    var body: some View {
        VStack {
            ZStack {
                // View backgtound
                Color.black.ignoresSafeArea()
                
                // Appear text
                VStack {
                    Text("Good Night")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .opacity(showText)
                    Spacer()
                }
                
                // Gray background for door
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 100))
                    path.addLine(to: CGPoint(x: 100, y: 500))
                    path.addLine(to: CGPoint(x: 290, y: 500))
                    path.addLine(to: CGPoint(x: 290, y: 100))
                    path.closeSubpath()
                }.foregroundColor(.gray)
                
                VStack {
                    
                    Door(insetX: insertX)
                    
                    // Light under the door
                    Path { path in
                        path.move(to: CGPoint(x: 100, y: 115))
                        path.addLine(to: CGPoint(x: 0, y: 200))
                        path.addLine(to: CGPoint(x: 390, y: 200))
                        path.addLine(to: CGPoint(x: 290, y: 115))
                        path.closeSubpath()
                    } .blur(radius: 3)
                        .foregroundStyle(.linearGradient(colors: [.black, .gray], startPoint: .bottomLeading, endPoint: .trailing))
                        .colorMultiply(color)
                }
            }
            
            .onTapGesture {
                withAnimation(.linear(duration: 0.5)) {
                    
                    self.onTap.toggle()
                    insertX = onTap ? 50 : 0
                    color = onTap ? .black : .white
                    
                    showText = onTap ? 1 : 0
                }
            }
        }
    }
}

struct DoorView_Previews: PreviewProvider {
    static var previews: some View {
        DoorView()
    }
}


struct Door: Shape {
    var insetX: Double
    
    var animatableData: Double {
        get { insetX }
        set { insetX = newValue }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 500))
        path.addLine(to: CGPoint(x: 240 + insetX, y: 450 + insetX))
        path.addLine(to: CGPoint(x: 240 + insetX, y: 150 - insetX))
        path.closeSubpath()
        
        return path
    }
}

