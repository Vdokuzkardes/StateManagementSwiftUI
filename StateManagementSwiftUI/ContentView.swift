//
//  ContentView.swift
//  StateManagementSwiftUI
//
//  Created by Vedat Dokuzkardeş on 10.12.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var counter = 0
    
    var body: some View {
        VStack {
            
            AddButtonView(counter: $counter)
            Text(String(counter))
        }
    }
}

struct AddButtonView : View {
    
    @Binding var counter : Int
    
    var body: some View {
        Button(action: {
            self.counter += 1
        }, label: {
            Text("Add")
        })
    }
}

#Preview {
    ContentView()
}
