//
//  LocationListView.swift
//  MapApp
//
//  Created by ck on 2023-09-15.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject var vm:LocationsViewModel
    
    var body: some View {
        List{
            
            listView
        }.padding()
        }
    }


struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationListView{
    var listView:some View{
        ForEach(vm.locations) { location in
            Button {
                vm.showNextLocation(location: location)
            } label: {
                
                HStack{
                    if let image=location.imageNames.first{
                        
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45,height: 45)
                            .cornerRadius(10)
                        
                    }
                    VStack(alignment: .leading,spacing: 10){
                        Text(location.name)
                            .foregroundColor(.red)
                        Text(location.cityName)
                            .foregroundColor(.black)
                    }
                    .frame( maxWidth: .infinity,alignment:.leading)
                    
                }
            }

            }
    }
}
