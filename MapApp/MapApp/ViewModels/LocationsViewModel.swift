//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by ck on 2023-09-13.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel:ObservableObject{
    //All locations
    @Published var locations:[Location]
    //Current map location
    @Published var mapLocation:Location{
        didSet{
            updateRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion:MKCoordinateRegion=MKCoordinateRegion()
    @Published var showButton:Bool=false
    @Published var showSheet:Location?=nil
    
    let mapSpan=MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init(){
        let locations = LocationsDataService.locations
        self.locations=locations
        self.mapLocation=locations.first!
        self.updateRegion(location: locations.first!)
    }
    
    private func updateRegion(location:Location){
        mapRegion=MKCoordinateRegion(center: location.coordinates, span: mapSpan)
    }
    func updateValues(){
        withAnimation(.easeOut){
            showButton = !showButton
        }
        
    }
    func showNextLocation(location:Location){
        withAnimation(.easeInOut){
            mapLocation=location
            showButton=false
        }
       
    }
    func showNextCity(){
        //Check for current index
       guard let currentIndex=locations.firstIndex(where: {
            $0 == mapLocation
        })
        else{
            return
        }
        //Check for next index
        let nextIndex=currentIndex+1
        guard locations.indices.contains(nextIndex)
        else{
            //There is no next Index
            //Restart from 0
            let firstLocation=locations.first!
            showNextLocation(location: firstLocation)
            return
        }
        //Next index is valid
        let nextLocation=locations[nextIndex]
        showNextLocation(location: nextLocation)
        
        
        
    }
}
