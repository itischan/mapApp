//
//  PreviewView.swift
//  MapApp
//
//  Created by ck on 2023-09-15.
//

import SwiftUI

struct PreviewView: View {
    @EnvironmentObject var vm:LocationsViewModel
     let location:Location
    var body: some View {
        HStack(alignment:.bottom){
            VStack(alignment: .leading){
               
            imageView
                    
            textView
                
                
            }.padding()
            HStack{
                VStack(alignment: .leading, spacing:20){
                    learnMoreButton
                    nextButton
                }
            }.padding()
            
        }
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y:70)
            }.clipped()
        
        
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            PreviewView(location: LocationsDataService.locations.first!)
        }
        .environmentObject(LocationsViewModel())
    }
}

extension PreviewView{
    var imageView:some View{
        ZStack{
            if let imageName=location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                    .cornerRadius(10)
                
            }
        }
    }
    var textView:some View{
        VStack{
            Text(location.name)
            Text(location.cityName)
        }
    }
    var learnMoreButton:some View{
        Button {
            vm.showSheet=location
        } label: {
            Text("Learn more")
                .foregroundColor(.yellow)
            
        }.frame(width:150)
        .buttonStyle(.borderedProminent)

    }
    var nextButton:some View{
        Button {
            vm.showNextCity()
        } label: {
            Text("Next")
                
        }         .frame(width: 150)

        .buttonStyle(.bordered)

    }
    
}
