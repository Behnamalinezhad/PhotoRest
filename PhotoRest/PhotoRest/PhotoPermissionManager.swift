//
//  PhotoPermissionManager.swift
//  PhotoRest
//
//  Created by Behnam on 4/8/24.
//

import Foundation
import Photos
import UIKit

class PhotoPermissionManager {
    // Request photo library authorization
    func requestPhotoLibraryPermission(completion: @escaping (PHAuthorizationStatus) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                completion(status)
            }
        }
    }
    
     //Check if photo library access is authorized
//    func isPhotoLibraryAuthorized() -> Bool {
//        return PHPhotoLibrary.authorizationStatus() == .authorized
//    }
    
    // Show an alert if permission is denied or restricted
    func showPermissionDeniedAlert() {
        let alert = UIAlertController(
            title: "Permission Denied",
            message: "Please enable photo library access in Settings.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //self.present(alert, animated: true, completion: nil)
    }
}
