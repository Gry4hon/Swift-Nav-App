//
//  AppDataModel.swift
//  DoorCodeNavigation
//
//  Created by Admin on 3/9/22.
//

import SwiftUI

class AppDataModel: ObservableObject {
    
    @Published var currentTab: Tab = .home;
    
    func checkDeepLink(url: URL)->Bool
    {
        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else
        {
            return false
        }
        if host == Tab.home.rawValue
        {
            currentTab = .home
        }
        else if host == Tab.map.rawValue
        {
            currentTab = .map
        }
        else if host == Tab.service.rawValue
        {
            currentTab = .service
        }
        else
        {
            return false
        }
        return true
    }
    
}

//Tab enum
enum Tab:String
{
    case home = "home"
    case map = "map"
    case service = "service"
}

