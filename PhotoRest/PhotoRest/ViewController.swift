//
//  ViewController.swift
//  PhotoRest
//
//  Created by Behnam on 4/8/24.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    let photoPermissionManager = PhotoPermissionManager() // Create an instance
    
    private let statusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.center = CGPoint(x: 200, y: 200) // Set the position
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(statusLabel)
        requestPhotoLibrary()
        
    }
    
    func requestPhotoLibrary() {
        
        photoPermissionManager.requestPhotoLibraryPermission { [weak self] status in
            
           // self?.checkAuthorizationStatus()
            switch status {
            case .authorized:
                self?.statusLabel.text = "Authurized"
            case .denied, .restricted:
                // Handle denied or restricted status (e.g., show an alert)
                self?.photoPermissionManager.showPermissionDeniedAlert()
                self?.statusLabel.text = "not Authurized"
            case .limited:
                self?.statusLabel.text = "Limited"
            default:
                break
            }
        }
    }
}

