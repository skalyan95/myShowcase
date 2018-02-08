//
//  FeedbackGenerator.swift
//  
//
//  Created by Sajan Kalyan on 1/28/18.
//

import UIKit

/// Easy, one line haptic feedback functions
class FeedbackGenerator {
    
    private init() {} // prevents initialization of this class
    
    /// single line function for notification haptic feedback
    class func notification(type: UINotificationFeedbackType) {
        var feedbackGenerator: UINotificationFeedbackGenerator?
        feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator?.prepare()
        feedbackGenerator?.notificationOccurred(type)
        feedbackGenerator = nil
    }
    
    /// single line function for impact haptic feedback
    class func impact(style: UIImpactFeedbackStyle) {
        var feedbackGenerator: UIImpactFeedbackGenerator?
        feedbackGenerator = UIImpactFeedbackGenerator(style: style)
        feedbackGenerator?.prepare()
        feedbackGenerator?.impactOccurred()
        feedbackGenerator = nil
    }
    
    /// single line function for selection haptic feedback
    class func selection() {
        var feedbackGenerator: UISelectionFeedbackGenerator?
        feedbackGenerator = UISelectionFeedbackGenerator()
        feedbackGenerator?.prepare()
        feedbackGenerator?.selectionChanged()
        feedbackGenerator = nil
    }
}
