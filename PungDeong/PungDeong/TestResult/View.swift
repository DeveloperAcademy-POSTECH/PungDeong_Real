//
//  View.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/11.
//

import SwiftUI
import UIKit

extension View {
  func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage? {

    // Get the main window.
    guard let window = UIApplication.shared.windows.first else {
      print("View.takeScreenshot: No main window found")
      return nil
    }

    // Create an image of the entire window. Note how we're using `window.bounds` for this
    // to capture the entire window.
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, 0.0)
    let renderer = UIGraphicsImageRenderer(bounds: window.bounds, format: UIGraphicsImageRendererFormat())
    let image = renderer.image { (context) in
      window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
    }
    UIGraphicsEndImageContext()

    /*
    At this point we have a screenshot of the entire window.
    Now we're going to crop it to just include the part of the screen
    we want.
    */

    // Scale is the pixel density of the screen. E.g. 3.0 on iPhone 12 Pro which has a 3x display.
    // This will be used in the UIImage extension below.
    let scale = UIScreen.main.scale
    let rect = CGRect(x: origin.x, y: origin.y, width: size.width, height: size.height)
    let croppedImage = image.cropped(boundingBox: rect, scale: scale)

    return croppedImage
  }
}

extension UIImage {
  func cropped(boundingBox: CGRect, scale: CGFloat) -> UIImage? {

  /*
  To crop UIImage we must first convert it to a CGImage.
  UIImage uses points, which are independent of pixels.

  Therefore, we need to take the scaling factor of the screen into account
  when cropping.

  For example, if we want to crop a 100x50pt square starting at (75, 90) from a UIImage
  on a device with a 2x scaling factor, we would multiple everything by 2 and crop a
  200x100px square starting at (150, 180).
  */

    let x = boundingBox.origin.x * scale
    let y = boundingBox.origin.y * scale
    let width = boundingBox.width * scale
    let height = boundingBox.height * scale

    let adjustedBoundingBox = CGRect(x: x, y: y, width: width, height: height)

    guard let cgImage = self.cgImage?.cropping(to: adjustedBoundingBox) else {
      print("UIImage.cropped: Couldn't create cropped image")
      return nil
    }

    return UIImage(cgImage: cgImage)
  }
}


extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
