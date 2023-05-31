//
//  ContentView.swift
//  WeSplit
//
//  Created by Jaden Lee on 2023-05-30.
//

import SwiftUI

struct ContentView: View {
    @State private var amountSpent : Double = 0
    @State private var numPeople : Int = 0
    @State private var tipSelction = 0
    private var tips = [0,10,15,18,20,25]
    
    private var eachPay: Double {
        let spentAmount = amountSpent
        let tipPick = Double(tipSelction)
        let peopleNum = Double(numPeople + 2)
        let tipCost = spentAmount * tipPick / 100
        let Pay = (spentAmount + tipCost) / peopleNum
        
        return Pay
    }
    
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
                    Picker("tips", selection: $tipSelction) {
                        ForEach(tips, id: \.self) {
                            Text($0 , format: .percent)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("How much tips ")
                }
                
                Section{
                    Text(eachPay, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
