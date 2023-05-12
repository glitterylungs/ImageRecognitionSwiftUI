//
//  MainViewModel.swift
//  ImageRecognitionSwiftUI
//
//  Created by Alicja Gruca on 12/05/2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var showPicker = false
    
    func showPhotoPicker() {
        showPicker = true
    }
}
