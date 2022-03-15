//
//  ContadorDeTabs.swift
//  TCA_TabView_Project
//
//  Created by Luciano Puzer on 14/03/22.
//

import SwiftUI

struct ContadorDeTabs: View {
    @State private var index = 0
    var body: some View {
        VStack {
        HStack(spacing: 2) {
            
            ForEach((0..<3), id: \.self) { index in
                Circle()
                    .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                    .frame(width: 20, height: 20)

            }
        }
        .padding()
        
        HStack(spacing: 2) {
            ForEach((0..<3), id: \.self) { index in
                Rectangle()
                    .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                    .frame(width: 20, height: 20)

            }
        }
        .padding()
        
        HStack(spacing: 2) {
            ForEach((0..<3), id: \.self) { index in
                Rectangle()
                    .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                    .frame(width: 30, height: 5)

            }
        }
        .padding()
        
        HStack(spacing: 2) {
            ForEach((0..<3), id: \.self) { index in
                Rectangle()
                    .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                    .frame(height: 5)
            }
        }
        .padding()
        }
    }
}

struct ContadorDeTabs_Previews: PreviewProvider {
    static var previews: some View {
        ContadorDeTabs()
    }
}
