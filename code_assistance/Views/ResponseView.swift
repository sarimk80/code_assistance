//
//  ResponseView.swift
//  code_assistance
//
//  Created by sarim khan on 07/04/2025.
//

import SwiftUI

struct ResponseView: View {
    @ObservedObject  var assistanceViewMode: AssistanceViewModel
    var body: some View {
        List {
            VStack{
                switch assistanceViewMode.assistanceState{
                    
                case .Initial:
                    Text("Welcome")
                        
                case .Error(let message):
                    Text(message)
                case .Loaded(let answer):
                        Text("""
                             \(answer)
                             """)
                        .font(.system(.body, design: .monospaced))
                    
                    
                    
                }
            }
        }
        
        .padding()
        .frame(width: 500,height: 500)
        
    }
}

#Preview {
    ResponseView(assistanceViewMode: AssistanceViewModel())
}
