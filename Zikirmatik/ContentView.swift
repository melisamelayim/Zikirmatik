//
//  ContentView.swift
//  Zikirmatik
//
//  Created by Max on 20.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount: Int = UserDefaults.standard.integer(forKey: "buttonCount")
    
    @State private var maxTapCount: Int = UserDefaults.standard.integer(forKey: "maxTapCount")
    
    var body: some View {
        NavigationView{
            VStack (spacing: 20){
                Spacer()
                
                Text("Sabrınızı ölçün!")
                    .padding()
                    .font(.title2)

                Text("Rekor: \(maxTapCount)")
                
                Button(action: {
                    tapCount += 1
                    UserDefaults.standard.set(tapCount, forKey: "buttonCount")
                    updateMaxTapCount()
                }) {
                    Image("red_button")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    .padding()
                }
                
                Spacer()
                
                Text("\(tapCount)")
                    .font(.title)
                    .padding()
                                
                Button(action: {
                    tapCount = 0
                }) {
                    Text("Sıfırla")
                        .font(.title2)
                        .padding()
                    }
                
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.2), Color.blue.opacity(0.1), Color.white.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationTitle("Zikirmatik")
        }
    }
    
    func updateMaxTapCount() {
        if tapCount > maxTapCount {
            maxTapCount = tapCount
            UserDefaults.standard.set(maxTapCount, forKey: "maxTapCount")
        }
    }
    
    
}

#Preview {
    ContentView()
}
