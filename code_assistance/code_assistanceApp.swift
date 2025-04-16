//
//  code_assistanceApp.swift
//  code_assistance
//
//  Created by sarim khan on 03/04/2025.
//

import SwiftUI

@main
struct code_assistanceApp: App {
    
    @ObservedObject private var assistanceViewMode = AssistanceViewModel()
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some Scene {
        
        MenuBarExtra("Translation", systemImage: "_gm") {
            ContentView(assistanceViewMode: assistanceViewMode)
        }
        .menuBarExtraStyle(.window)
        .onChange(of: assistanceViewMode.isOpenWindow) { oldValue, newValue in
            dismissWindow(id: "id_tra")
            NSApplication.shared.activate(ignoringOtherApps: true)
            openWindow(id: "id_tra")
        }
//        
        Window("Translated Text", id: "id_tra") {
            ResponseView(assistanceViewMode: assistanceViewMode)
                .background(.ultraThinMaterial)
        }
        .windowResizability(.contentSize)
        .defaultPosition(.bottomTrailing)
        
        
        

    }
}
