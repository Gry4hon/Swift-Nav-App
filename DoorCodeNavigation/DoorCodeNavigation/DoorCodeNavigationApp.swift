//
//  DoorCodeNavigationApp.swift
//  DoorCodeNavigation
//
//  Created by Preston Valles on 3/3/22.
//

import SwiftUI

@main
struct DoorCodeNavigationApp: App {
    @StateObject var appData: AppDataModel = AppDataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                .onOpenURL{ url in
                    if appData.checkDeepLink(url: url)
                    {
                        print("From Deep Link")
                    }
                    else{
                        print("FALL Back Deep Link")
                    }
                    
                }
        }
    }
}


