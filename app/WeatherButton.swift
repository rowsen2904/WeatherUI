//
//  WeatherButton.swift
//  app
//
//  Created by Rowsen on 9/10/23.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonText: String
    var color: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(color)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(30)
    }
}
