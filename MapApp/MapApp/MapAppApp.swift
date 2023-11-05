//
//  MapAppApp.swift
//  MapApp
//
//  Created by ck on 2023-09-11.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject var vm = LocationsViewModel()
    var body: some Scene {
        
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
