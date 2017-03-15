//
//  CameraController.swift
//  SnapChat
//
//  Created by Phoenix on 2017/3/14.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit
import AVFoundation

class CameraController: UIViewController, AVCapturePhotoCaptureDelegate {

    var cameraView: UIView!
    var tempImageView: UIImageView!
    
    var captureSession: AVCaptureSession?
    var photoOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraView = UIView()
        cameraView.frame = view.bounds
        view.addSubview(cameraView)

        view.backgroundColor = .white
        tempImageView = UIImageView()
        view.addSubview(tempImageView!)
        tempImageView.frame = view.bounds
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error: NSError?
        var input: AVCaptureDeviceInput?
        
        do {
            input = try AVCaptureDeviceInput(device: captureDevice)
        } catch let cameraError as NSError {
            error = cameraError
            input = nil
        }
        
        if error == nil && (captureSession?.canAddInput(input))! {
            captureSession?.addInput(input)
            photoOutput = AVCapturePhotoOutput()

            
            if (captureSession?.canAddOutput(photoOutput))! {
                captureSession?.addOutput(photoOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                
                cameraView.layer.addSublayer(previewLayer!)
                previewLayer?.frame = cameraView.bounds
                captureSession?.startRunning()
            }
        }
    }
    
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let error = error {
            print("error occure : \(error.localizedDescription)")
        }
        
        if  let sampleBuffer = photoSampleBuffer,
            let previewBuffer = previewPhotoSampleBuffer,
            let dataImage =  AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer:  sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
            print(UIImage(data: dataImage)?.size as Any)
            
            let dataProvider = CGDataProvider(data: dataImage as CFData)
            let cgImageRef: CGImage! = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: UIImageOrientation.right)
            
            tempImageView.image = image
            didTakePhoto = true
            tempImageView.isHidden = false
        }
        else {
            print("some error here")
        }
    }


    func didPressTakePhoto(){
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [
            kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
            kCVPixelBufferWidthKey as String: 160,
            kCVPixelBufferHeightKey as String: 160
        ]
        settings.previewPhotoFormat = previewFormat
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    var didTakePhoto = Bool()
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if didTakePhoto == true{
            tempImageView.isHidden = true
            didTakePhoto = false
        }
        else {
            didPressTakePhoto()
        }
    }

}
