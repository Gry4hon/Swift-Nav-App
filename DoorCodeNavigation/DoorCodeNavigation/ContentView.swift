//
//  ContentView.swift
//  DoorCodeNavigation
//
//  Created by Preston Valles on 3/3/22.
//

import SwiftUI
import CodeScanner
//SwiftUI is just glorified HTML and CSS lol

struct ContentView: View {
    @EnvironmentObject var appData: AppDataModel
    var body: some View{
        Home().environmentObject(appData)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}

