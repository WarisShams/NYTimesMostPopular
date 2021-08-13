//
//  Extensions.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import UIKit


// MARK: - UIColor -
extension UIColor {
    convenience init(hex: String) {
        let hexa = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        var rgbValue = UInt64()
        Scanner(string: hexa).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}


// MARK: - UIViewController Extension -
extension UIViewController {
    func showLoadingActivity() {
        self.view.makeToastActivity(ToastPosition.center)
    }
    
    func hideLoadingActivity() {
        self.view.hideToastActivity()
    }
    
    func showToast(_ text: String) {
        self.view.makeToast(text, duration: ToastManager.shared.duration, position: ToastManager.shared.position, title: nil, image: nil, style: ToastManager.shared.style, completion: nil)
    }
    
    // MARK:-  Present Alert View -
    /**
      Handling of presenting of AlertViewController on iPad and iPhone.
     
     - Parameter alertView: UIViewController
     - Parameter completion: Void completion of present for customization.
     
     */
    func presentAlertView(_ alertView: UIViewController, completion: (() -> Void)? = nil) {
        
        alertView.modalPresentationStyle = UIModalPresentationStyle.popover
        
        if let popoverController = alertView.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.height, width: 0, height: 0)
            popoverController.dimmingView?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(alertView, animated: true, completion: completion)
    }
}

// MARK: - UIPopoverPresentationController Extension -
extension UIPopoverPresentationController {
    var dimmingView: UIView? {
        return value(forKey: "_dimmingView") as? UIView
    }
}
