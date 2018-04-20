//
//  BarcodeGenerator.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public class BarcodeGenerator {
  
  static func generateQRCodeWithAlphaBackground(from value: String, size: CGSize) -> UIImage? {
    let data = value.data(using: String.Encoding.isoLatin1, allowLossyConversion: false);
    
    guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil; }
    filter.setValue(data, forKey: "inputMessage");
    filter.setValue("H", forKey: "inputCorrectionLevel"); // Level H (High)  30% of codewords can be restored.
    guard let originalImage = filter.outputImage else { return nil; }
    
    let transformedOriginalImage = originalImage.transformed(by: CGAffineTransform(scaleX: size.width/originalImage.extent.size.width, y: size.height/originalImage.extent.size.height));
    
    guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return nil; }
    colorInvertFilter.setValue(transformedOriginalImage, forKey: kCIInputImageKey);
    guard let invertedImage = colorInvertFilter.outputImage else { return nil; }
    
    guard let maskToFilter = CIFilter(name: "CIMaskToAlpha") else { return nil; }
    maskToFilter.setValue(invertedImage, forKey: kCIInputImageKey);
    guard let maskedImage = maskToFilter.outputImage else { return nil; }
    
    return UIImage(ciImage: maskedImage).withRenderingMode(.alwaysTemplate); // Use tint color to config color
  }
  
  static func generateBarCodeWithAlphaBackground(from value: String, size: CGSize) -> UIImage? {
    guard let data = value.data(using: String.Encoding.ascii, allowLossyConversion: false) else { return nil; }
    
    guard let filter = CIFilter(name: "CIPDF417BarcodeGenerator") else { return nil; }
    filter.setValue(data, forKey: "inputMessage");
    guard let originalImage = filter.outputImage else { return nil; }
    
    let transformedOriginalImage = originalImage.transformed(by: CGAffineTransform(scaleX: size.width/originalImage.extent.size.width, y: size.height/originalImage.extent.size.height));
    
    guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return nil; }
    colorInvertFilter.setValue(transformedOriginalImage, forKey: kCIInputImageKey);
    guard let invertedImage = colorInvertFilter.outputImage else { return nil; }
    
    guard let maskToFilter = CIFilter(name: "CIMaskToAlpha") else { return nil; }
    maskToFilter.setValue(invertedImage, forKey: kCIInputImageKey);
    guard let maskedImage = maskToFilter.outputImage else { return nil; }
    
    return UIImage(ciImage: maskedImage).withRenderingMode(.alwaysTemplate); // Use tint color to config color
  }
}
