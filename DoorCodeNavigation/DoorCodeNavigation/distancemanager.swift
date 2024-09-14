//
//  distancemanager.swift
//  DoorCodeNavigation
//
//  Created by Jason Tipp on 4/21/22.
//

import SwiftUI

struct distancemanager: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
    var body: some View
    {
        Text(MockPedometer.instance.distance.formatted())
    }
}

struct distancemanager_Previews: PreviewProvider {
    static var previews: some View {
        distancemanager()
    }
}
