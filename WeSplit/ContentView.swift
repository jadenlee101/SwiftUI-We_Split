//
//  ContentView.swift
//  WeSplit
//
//  Created by Jaden Lee on 2023-05-30.
//

import SwiftUI

struct ContentView: View {
    @State private var amountSpent : Int = 0
    @State private var numPeople : Int = 0
    
    @State private var tips = [0,10,15,18,20,25]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amo", value: $amountSpent, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numPeople){
                        ForEach(2..<10) {
                            Text("\($0)")
                        }
                    }
                    
                }
                Section {
                    Picker("tips", selection: $tips) {
                        ForEach(tips, id: \.self) {
                            Text($0 , format: .percent)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("How much tips ")
                }
                
                Section{
                    
                } header: {
                    Text("Each person will pay: ")
                    
                }
            }
            
            .navigationTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
