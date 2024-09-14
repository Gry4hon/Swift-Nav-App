//  Haptics.swift
//  DoorCodeNavigation
//
//  Created by Griffin Penn on 4/14/22.
//

import SwiftUI
import CoreHaptics
import UIKit


final class HapticsManager
{
static let shared = HapticsManager()

private init() {}

public func reachedLocation(for type: String)
{
let noticiationGenerator = UINotificationFeedbackGenerator()
noticiationGenerator.prepare()
    noticiationGenerator.notificationOccurred(.success)

}
    public func lightHaptics(for type: String)
    {
        let noticiationGenerator = UIImpactFeedbackGenerator(style: .light)
        noticiationGenerator.impactOccurred()

    }
    public func mediumHaptics(for type: String)
    {
        let noticiationGenerator = UIImpactFeedbackGenerator(style: .medium)
        noticiationGenerator.impactOccurred()

    }
    public func heavyHaptics(for type: String)
    {
        let noticiationGenerator = UIImpactFeedbackGenerator(style: .heavy)
        noticiationGenerator.impactOccurred()
        
    }

}

//For ending to a string object

public func dothing()
{
    HapticsManager.shared.reachedLocation(for: "Success")
}

public func leftBuzz(){
    HapticsManager.shared.reachedLocation(for: "light")
}

public func rightBuzz(){
    HapticsManager.shared.reachedLocation(for: "heavy")
}
//example of being used in a string

//potentially this




//public func movementButtonTapped(sender: UIButton1)
//{

let generator = UINotificationFeedbackGenerator()

//generator.notificationOccurred(.success)


//public func movementButton2Tapped(sender: UIButton2)
//{

//let generator = UINotificationFeedbackGenerator(){
//    generator.notificationOccurred(.success)
//}
//
//
//public func movementButton3Tapped(sender: UIButton3)
//{
//let generator = UINoticifcationFeedbackGenerator()
//generator.noticiationOccured(.success)
//}
//
//public func movementButton4Tapped(sender: UIButton4)
//{
//let generator = UINotificationFeedbackGenerator()
//generator.noticiationOccured(.success)
//}


//For sending to a button being pressed

//potential for using 4 buttons layered ontop of eachother
//hide and disable button for a diectional change


protocol CHHapticPatternPlayer{
    
}


class CHHapticPattern : NSObject{
    
}

//func makePlayer(with pattern: CHHapticPattern) throws -> CHHapticPatternPlayer{
//
//}

//https://developer.apple.com/documentation/corehaptics/chhapticpattern
//Might be better for directional haptics

//step counter


//to start updates in the app

func stopEventUpdates(){}

//for stopping the pedometer when getting to the location


//func isStepCountingAvailable() -> Bool{
//
//}
////Returns a Boolean value indicating whether step counting is available on the current device.
//func isDistanceAvailable() -> Bool{
//
//}
////Returns a Boolean value indicating whether distance estimation is available on the current device.
//func isFloorCountingAvailable() -> Bool{
//
//}
////Returns a Boolean value indicating whether floor counting is available on the current device.
//func isPaceAvailable() -> Bool{
//
//}
////Returns a Boolean value indicating whether pace information is available on the current device.
//func isCadenceAvailable() -> Bool{
//
//}
////Returns a Boolean value indicating whether cadence information is available on the current device.
//func isPedometerEventTrackingAvailable() -> Bool{
//
//}
////Returns a Boolean value indicating whether pedometer events are available on the current device.
//func authorizationStatus() -> CMAuthorizationStatus{
//
//}
//Returns a value indicating whether the app is authorized to gather pedometer data.
                //enum CMAuthorizationStatus{}
//The authorization status for motion-related features.

//All the checks available for step counters


//https://github.com/kr1s0404/SwiftUI-HapticDemo

