//
//  LocationDetailView.swift
//  MapApp
//
//  Created by ck on 2023-09-18.
//

import SwiftUI

struct LocationDetailView: View {
    let location:Location
    var body: some View {
        ScrollView{
            VStack{
               tabView
                titleSection
                Divider()
                Text(location.description)
                    .font(.footnote)
                Divider()
                if let url=URL(string: location.link){
                    Link("Read more", destination: url)
                        .tint(.blue)
                    
                }
            }
        }.ignoresSafeArea()
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
    }
}

extension LocationDetailView{
    private var tabView:some View{
        TabView{
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)

        .tabViewStyle(PageTabViewStyle())
    }
    private var titleSection:some View{
        VStack(alignment: .leading){
            
            Text(location.name)
                .font(.largeTitle)
            Text(location.cityName)
                .font(.subheadline)
         
            
        }.frame(maxWidth: .infinity,alignment:.leading)
            .padding()
    }
}
