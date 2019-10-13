//
//  ContentView.swift
//  AnimatedBarCharts
//
//  Created by Sean on 2019/10/13.
//  Copyright © 2019 Sean. All rights reserved.
//

import SwiftUI

struct DayDataPoint {
    let day: String
    let value: CGFloat
}

struct ContentView: View {
    @State var pickerSelectedItem = 0
    static let moringDataPoints: [DayDataPoint] = [
        DayDataPoint(day: "Mon", value: 0.5),
        DayDataPoint(day: "Tue", value: 0.2),
        DayDataPoint(day: "Wed", value: 0.1),
        DayDataPoint(day: "Thu", value: 0.9),
        DayDataPoint(day: "Fri", value: 0.3),
        DayDataPoint(day: "Sat", value: 0.8),
        DayDataPoint(day: "Sun", value: 0.4)
    ]
    
    static let afternoonDataPoints: [DayDataPoint] = [
        DayDataPoint(day: "Mon", value: 0.3),
        DayDataPoint(day: "Tue", value: 0.9),
        DayDataPoint(day: "Wed", value: 0.7),
        DayDataPoint(day: "Thu", value: 0.2),
        DayDataPoint(day: "Fri", value: 0.4),
        DayDataPoint(day: "Sat", value: 0.1),
        DayDataPoint(day: "Sun", value: 0.6)
    ]
    
    static let eveningDataPoints: [DayDataPoint] = [
        DayDataPoint(day: "Mon", value: 0.6),
        DayDataPoint(day: "Tue", value: 0.5),
        DayDataPoint(day: "Wed", value: 0.3),
        DayDataPoint(day: "Thu", value: 0.1),
        DayDataPoint(day: "Fri", value: 0.2),
        DayDataPoint(day: "Sat", value: 0.75),
        DayDataPoint(day: "Sun", value: 1.0)
    ]
    
    @State var dataSet = [moringDataPoints, afternoonDataPoints, eveningDataPoints]
    
    var body: some View {
        ZStack {
            Color("appBackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Calorie Intake")
                    .modifier(TitleViewModifier())
                    
                Picker(selection: $pickerSelectedItem.animation(.default), label: Text("")) {
                    Text("Morning").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack(spacing: 16) {
                    ForEach(0..<dataSet[pickerSelectedItem].count) { i in
                        BarView(value: self.dataSet[self.pickerSelectedItem][i].value, day: self.dataSet[self.pickerSelectedItem][i].day)
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

struct TitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 34, weight: .semibold))
            .foregroundColor(Color("titleColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
