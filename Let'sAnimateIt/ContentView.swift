//
//  ContentView.swift
//  Let'sAnimateIt
//
//  Created by Artem Vinogradov on 06.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var showText: Double = 0
    @State var onTap = false
    
    var body: some View {
        ZStack {
            DoorView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

