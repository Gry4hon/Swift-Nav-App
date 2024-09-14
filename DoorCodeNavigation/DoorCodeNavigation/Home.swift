//
//  Home.swift
//  DoorCodeNavigation
//
//  Created by Admin on 3/9/22.
//

import SwiftUI
import CodeScanner
import CoreMotion

struct Home: View {
    @EnvironmentObject var appData: AppDataModel 

    var body: some View {
        //says something
            TabView(selection: $appData.currentTab)
            {
                
                HomeView()
                    .environmentObject(appData)
                    .tag(Tab.home)
                    .tabItem {
                        Label("QR", systemImage: "camera")
                        
                }
                
                MapView()
                    .environmentObject(appData)
                    .tag(Tab.map)
                    .tabItem{
                        Label("Direction", systemImage: "location")
                        
                }
                ServiceView()
                    .environmentObject(appData)
                    .tag(Tab.service)
                    .tabItem{
                        Label("Services", systemImage: "search")
                }
                
                
            }
            .environmentObject(appData)
        }
}
    


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct HomeView: View
{
    @EnvironmentObject var appData: AppDataModel
    //Values for images to cycle on map page
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan QR code"
    
    
    var body: some View{
        
       
        CodeScannerView(
        codeTypes: [.qr],
         completion: { result in
            if case let .success(code) = result
            {
                self.isPresentingScanner = false
                self.scannedCode = code.string
                if let url = URL(string: code.string) {
                    UIApplication.shared.open(url)
                    
                }
            }
        }
        )
        
        
    }
    
     
}

/// Provides to create an instance of the CMMotionActivityManager.
private let activityManager = CMMotionActivityManager()
/// Provides to create an instance of the CMPedometer.
private let pedometer = CMPedometer()
var pedoValue: Int = 0

public var textLabel:String = ""


var checkSteps: Bool = true;

struct MapView: View{
        
    private var numberOfImages = 7
    @State private var currentIndex = 0
    @State private var arrow = false;
    
    var motionManager = CMMotionManager()

    

    func InitPedometer()
    {

        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
      
        
        var target:Int = 0
        var stepCount:Int = 0
        let targetNumbers = [9, 2, 24, 2, 5, 7]
        print(checkSteps)
        if(checkSteps == true)
        {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true)
            { timer in
            
            if let data = self.motionManager.accelerometerData
            {
                let z = data.acceleration.z
                
                print(z)
                
                if(z < -0.15)
                {
                    stepCount += 1
                    print(stepCount)
                }
                if(stepCount == targetNumbers[target])
                {
                    Next()
                    stepCount = 0
                    
                    target += 1
                    
                }
                
                if(target == targetNumbers.count - 1){
                    checkSteps = false;
                    
                    timer.invalidate()
                    target = 0
                    
                }
            }
            
        }
        }
    }
    
    func Next()
        {
            textLabel = "Go to stairs"
            dothing()
            currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
            
            if(currentIndex == 1)
            {
                Next()
            }
            
            if(currentIndex == 3)
            {
                
                textLabel = "Go past Einsteins"
                SoundManager.instance.playSound()
                dothing()
                arrow = true
                let arrowTimer = Timer.scheduledTimer(withTimeInterval: 3,  repeats: false)
                {
                    arrowTimer in
                    arrow = false;
                }
                
            }
            if(currentIndex == 5)
            {
                textLabel = "Turn left into the Zone"
                SoundManager.instance.playSound()
                dothing()
                arrow = true
                let arrowTimer2 = Timer.scheduledTimer(withTimeInterval: 3,  repeats: false)
                {
                    arrowTimer in
                    arrow = false;
                }
            }
        }
        func Previous()
        {
            currentIndex = currentIndex > 0 ? currentIndex - 1 : numberOfImages - 1
        }
    
        var body: some View{
            
            
            GeometryReader {proxy in
                VStack{
                TabView(selection: $currentIndex){
                    ForEach(1..<numberOfImages) { num in Image("\(num)")
                    .resizable()
                    .scaledToFill()
                    .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
                    .frame(width: proxy.size.width, height:proxy.size.height / 3)
                    //.padding([.top], 100)
                    .onAppear
                        {
                            InitPedometer()
                        }
                        
            
            
            
                Button{
                   Previous()
                    
                } label: {Text("PreviousButton")}
            
                Button{
                    Next()
                    
                } label: {Text("NextButton")}
                }
                 
                
                
                CodeScannerView(
                codeTypes: [.qr],
                 completion: { result in
                    if case let .success(code) = result
                    {
                    }
                    }
                
                )
                .frame(width: 450.0, height: 350.0, alignment: .bottom)
                .offset(y: 320)
                .overlay(arrowOverlay)
           
                
            }
        }
    @ViewBuilder private var arrowOverlay: some View{
        
        if(arrow)
        {
            Image("arrow")
                .resizable()
                .frame(width: 200 ,height: 200)
                .offset(x:-20, y: 320)
        }
        
    }
        
    }


    struct ServiceView: View{
        
        
        var body: some View {
                NavigationView {
                    List {
                        NavigationLink(destination: ILCINFO()) {
                                            Text("ILC Info")
                                        }
                            
                        NavigationLink(destination: Zone()) {
                                            Text("The Zone")
                                        }
                        Link(
                            "Einstein Bros Bagels",
                            destination: URL(string:"https://einsteinbros.com")!
                        )
                    }
                    .navigationTitle("ILC Services")
                }
    }
}

struct ILCINFO: View
{
    var body: some View
    {
        VStack(alignment: .leading, spacing: 10) {
                           
                            
        Image("ilc")
                            //These are modifiers, kinda like CSS
            .resizable()
            .frame(width: 350.0, height: 350.0)
            
                        
                        
        Text("ILC")
            .font(.system(size: 40))
            .fontWeight(.heavy)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            
                                
        Text("Hours 9:45am - 5:30pm")
            .fontWeight(.heavy)
            
        }
    
    }
    
}

private func callNumber() {
  if let phoneCallURL = URL(string: "tel://\("2084264357")") {
    let application:UIApplication = UIApplication.shared
    if (application.canOpenURL(phoneCallURL)) {
        application.open(phoneCallURL, options: [:], completionHandler: nil)
    }
  }
}

struct Zone: View
{
    var body: some View
    {
        VStack
        {
            Image("HelpDeskatZone")
                .resizable()
                    .frame(width: 350.0, height: 350.0)
            Text("Information is placed here")
        }
        .padding([.bottom], 50)
        
        HStack
        {
            Link("Create a ticket", destination: URL(string: "support.boisestate.edu")!)
                .environment(\.openURL, OpenURLAction { url in
                    print("Open \(url)")
                    return .handled
                })
            Button(action: callNumber)
            {
                Text("Call")
            }
            NavigationLink(destination: MapView()) {
                                Text("Directions")
                            }
            
        }
    
        
    }
}
