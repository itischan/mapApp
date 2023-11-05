//
//  LocationsView.swift
//  MapApp
//
//  Created by ck on 2023-09-13.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject var vm : LocationsViewModel
   
    var body: some View {
        ZStack{
            mapLayer
            
            VStack {
                header
                .padding()
                Spacer()
                ZStack{
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location{
                            PreviewView(location: location)
                                .shadow(color: .black, radius: 20, y: 10)
                                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                                .padding()
                        }
                    }
                }
            }
            
        }.sheet(item: $vm.showSheet) { location in
            LocationDetailView(location: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView{
    var header:some View{
        VStack{
            Button {
                vm.showButton.toggle()
            } label: {
                Text(vm.mapLocation.name + " ," + vm.mapLocation.cityName)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        
                        .background(.thickMaterial)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .rotationEffect(Angle(degrees: vm.showButton ? 180:0))
                                .padding()
                                
                        }
            }
           
            if vm.showButton{
                LocationListView()
            }
            
            
        }
        .cornerRadius(10)
        .shadow(color: .black, radius: 20,x: 5,y:10)

    }
    private var mapLayer:some View{
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations) { location in
            MapAnnotation(coordinate: location.coordinates) {
                MapPinView()
                    .scaleEffect(vm.mapLocation == location ? 1: 0.5)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
    }
}
