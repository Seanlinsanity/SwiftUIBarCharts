//
//  ContentView.swift
//  AnimatedBarCharts
//
//  Created by Sean on 2019/10/13.
//  Copyright © 2019 Sean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
        [0.5, 0.8, 0.2, 0.3, 0.9, 0.1, 0.6],
        [0.1, 0.7, 0.5, 0.9, 0.1, 1.0, 0.4],
        [0.6, 0.2, 0.9, 0.3, 0.7, 0.4, 1.0]
    ]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        ZStack {
            Color("appBackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Calorie Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("titleColor"))
                Picker(selection: $pickerSelectedItem.animation(.default), label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack(spacing: 16) {
                    ForEach(0..<days.count) { i in
                        BarView(value: self.dataPoints[self.pickerSelectedItem][i], day: self.days[i])
                    }
                }.padding(.top, 24)
            }
        }
    }
}

struct BarView: View {
    let height: CGFloat = 200
    var value: CGFloat
    var day: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: height)
                    .foregroundColor(Color(#colorLiteral(red: 0.3125754297, green: 0.9641550183, blue: 0.6935725808, alpha: 1)))
                Capsule().frame(width: 30, height: height * value)
                    .foregroundColor(.white)
            }
            Text(day).padding(.top, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
