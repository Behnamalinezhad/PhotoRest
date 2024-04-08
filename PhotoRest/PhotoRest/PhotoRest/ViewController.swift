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
        let label = UILabel()
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
        addConstraints()
        
    }
    
    func requestPhotoLibrary() {
        
        photoPermissionManager.requestPhotoLibraryPermission { [weak self] status in
            
            switch status {
            case .authorized:
                self?.statusLabel.text = "Authurized"
            case .denied, .restricted:
                // Handle denied or restricted status (e.g., show an alert)
                self?.showPermissionDeniedAlert()
                self?.statusLabel.text = "not Authurized"
            case .limited:
                self?.statusLabel.text = "Limited"
            default:
                break
            }
        }
    }
    
    func showPermissionDeniedAlert() {
        let alert = UIAlertController(
            title: "Permission Denied",
            message: "Please enable photo library access in Settings.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

        ])
    }
}

