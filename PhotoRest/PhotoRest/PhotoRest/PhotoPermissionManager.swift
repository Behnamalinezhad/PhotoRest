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
}
