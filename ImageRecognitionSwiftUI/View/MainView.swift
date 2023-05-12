//
//  ContentView.swift
//  ImageRecognitionSwiftUI
//
//  Created by Alicja Gruca on 01/04/2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Basic"), lineWidth: 6))
                        .shadow(radius: 5)
                }
                else {
                    Image("Sample")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Basic"), lineWidth: 6))
                        .shadow(radius: 5)
                }
                
                if (!viewModel.results.isEmpty){
                    
                    Text(viewModel.results[0] ?? "")
                        .padding(.top, 50)
                        .font(.system(size: 20))
                    Text(viewModel.results[1] ?? "")
                        .font(.system(size: 20))
                    Text(viewModel.results[2] ?? "")
                        .font(.system(size: 20))
                    
                }
            }
            .padding(20)
            .navigationTitle("ImageRecognition")
            .toolbar {
                Button {
                    viewModel.showPhotoPicker()
                } label: {
                    Image(systemName: "camera").foregroundColor(Color("Basic"))
                }
            }
            .sheet(isPresented: $viewModel.showPicker) {
                ImagePicker(sourceType: .camera, selectedImage: $viewModel.image, onImageSelected: { image in
                    guard let ciImage = CIImage(image: image) else {
                        return
                    }
                    viewModel.detect(image: ciImage)
                })
            }
        
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
    }
}
