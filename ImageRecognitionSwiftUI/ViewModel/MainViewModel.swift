//
//  MainViewModel.swift
//  ImageRecognitionSwiftUI
//
//  Created by Alicja Gruca on 12/05/2023.
//

import SwiftUI
import CoreML
import Vision

class MainViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var results: [String?] = Array()
    
    func showPhotoPicker() {
        showPicker = true
    }
    
    func detect(image: CIImage) {

        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process Image")
            }
            
            self.results = results
                .map { $0.identifier }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
}
