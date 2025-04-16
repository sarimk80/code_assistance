//
//  ContentView.swift
//  code_assistance
//
//  Created by sarim khan on 03/04/2025.
//

import SwiftUI
import Cocoa



struct ContentView: View {
    
    @ObservedObject  var assistanceViewMode : AssistanceViewModel
    
    var body: some View {
        VStack {
            
            Picker(selection: $assistanceViewMode.pickerListState) {
                ForEach(PickerList.allCases){list in
                    Text(list.rawValue)
                }
            } label: {
                Text("Selection")
            }
            .pickerStyle(.menu)
            
            
            
        }
        .padding()
        
            
    }
}

#Preview {
    ContentView(assistanceViewMode: AssistanceViewModel())
}
