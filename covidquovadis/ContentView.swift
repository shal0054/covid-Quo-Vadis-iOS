//
//  ContentView.swift
//  covidquovadis
//
//  Created by Karim Shaloh on 2024-10-30.
//

import SwiftUI

struct ContentView: View {
    // state variables to control the visibility of the alerts
    @State var showingZeroAlert = false
    @State var showingMaxAlert = false
    
    // mutable state variable to track number of people in a room
    @State var counter = 0
    
    // an immutable variable to set max room capacity
    let maxCapacity = 5

    var body: some View {
        VStack() {
            Text("Covid Quo Vadis")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()

            HStack(spacing: 5) {
                Button(action: decrementCounter) {
                    Text("-")
                        .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .alert(isPresented: $showingZeroAlert) {
                    Alert(
                        title: Text("There's no one left in the room!"),
                        dismissButton: .default(Text("OK"))
                    )
                }

                Text("\(counter)")
                    .font(.system(size: 80, weight: .bold))

                Button(action: incrementCounter) {
                    Text("+")
                        .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .alert(isPresented: $showingMaxAlert) {
                    Alert(
                        title: Text("The room is at capacity!"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }  // end HStack
            
            Spacer()

            Text("The maximum room capacity is \(maxCapacity)")
        }  // end VStack
        .padding()
    }

    // Function to increment the counter or show alert
    func incrementCounter() {
        if counter == maxCapacity {
            showingMaxAlert = true
        } else {
            counter += 1
        }

    }

    // Function to decrement the counter or show alert
    func decrementCounter() {
        if counter == 0 {
            showingZeroAlert = true
        } else {
            counter -= 1
        }
    }
}

#Preview {
    ContentView()
}
