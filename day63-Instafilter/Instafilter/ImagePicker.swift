//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Michael Knepprath on 9/14/20.
//  Copyright © 2020 Michael Knepprath. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
