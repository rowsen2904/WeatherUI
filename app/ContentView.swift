//
//  ContentView.swift
//  app
//
//  Created by Rowsen on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityNameView(cityName: "Ashgabat, TM")
                VStack(spacing: 8) {
                    TodaysWeatherView(imageName: "cloud.sun.fill", temperature: 34)
                }
                
                .padding(.bottom, 70)
                
                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "SUN", imageName: "sun.max.fill", temperature: 34)
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 26)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 31)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 31)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ButtonView(buttonText: "Change Day Time", color: Color.white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .white : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding(.top, 20)
    }
}


struct TodaysWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
    }
}
