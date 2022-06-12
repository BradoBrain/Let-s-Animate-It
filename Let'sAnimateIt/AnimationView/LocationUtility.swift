//
//  LocationUtility.swift
//  Let'sAnimateIt
//
//  Created by Artem Vinogradov on 11.06.2022.
//

import SwiftUI

struct LocationUtility: View {
    @State private var rectPosition = CGPoint(x: 50, y: 50)
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.green.opacity(0.2))
                        .frame(width: 70, height: 70)
                        .position(rectPosition)
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(.red)
                        .position(rectPosition)
                }
                Text("x: \(rectPosition.x) y: \(rectPosition.y)")
                
                
            }
            .gesture(DragGesture().onChanged({ value in
                self.rectPosition = value.location
            }))
            
            
            Spacer()
        }
    }
}

struct LocationUtility_Previews: PreviewProvider {
    static var previews: some View {
        LocationUtility()
    }
}
