//
//  ContentView.swift
//  ImageRecognitionSwiftUI
//
//  Created by Alicja Gruca on 01/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("Sample")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Basic"), lineWidth: 6))
                    .shadow(radius: 5)
                
                Text("Rainbow")
                    .padding(.top, 50)
                    .font(.system(size: 20))
                Text("Forest")
                    .font(.system(size: 20))
                Text("Grass")
                    .font(.system(size: 20))
                
            }
            .padding(20)
            .navigationTitle("ImageRecognition")
            .toolbar {
                Button {
                    print("Camera button clicked")
                } label: {
                    Image(systemName: "camera").foregroundColor(Color("Basic"))
                }
            }
        
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
