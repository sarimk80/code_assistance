//
//  assistance_view_model.swift
//  code_assistance
//
//  Created by sarim khan on 03/04/2025.
//

import Combine
import Cocoa
import SwiftUI

enum AssistanceState {
    case Initial
    case Loaded(text:String)
    case Error(errorMessage:String)
}

enum PickerList: String, CaseIterable, Identifiable {
    case TextTranslation
    case CodeAssistance
    case EmailReply
    
    var id : Self {self}
}

class AssistanceViewModel : ObservableObject{
    
    
    @Published var clipText:String = ""
    @Published  var assistanceState = AssistanceState.Initial
    @Published var pickerListState = PickerList.TextTranslation
    private var lastChangeCount = NSPasteboard.general.changeCount
    var cancellable=Set<AnyCancellable>()
    //private var cancellable: AnyCancellable?
    @Published var isOpenWindow = false
    
    let assistanceRepo:AssistanceRepo = AssistanceRepo()
    
    let timerPublisher = Timer.TimerPublisher(interval: 0.9, runLoop: .main, mode: .default).autoconnect()
    
    
    init() {
        checkCopy()
    }
    
    
    func checkCopy()  {
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { time in
                self.isOpenWindow = false
                let pasteboard = NSPasteboard.general
                if(pasteboard.changeCount != self.lastChangeCount){
                    self.lastChangeCount = pasteboard.changeCount
                    if let text = pasteboard.string(forType: .string){
                        self.clipText = text
                        self.isOpenWindow = true
                        self.assistanceState = AssistanceState.Initial
                        self.checkPicker(text: text)
                        
                    }
                }
            }
            .store(in: &cancellable)
    }

    
    func checkPicker(text:String){
        switch self.pickerListState {
        case .TextTranslation:
            print("TextTranslation")
            self.assistanceRepo.getTranslatedText(text: text)
                .sink { [weak self] completion in
                    
                    switch completion {
                    case .finished:
                        print("Error")
                    case .failure(let error):
                        self?.assistanceState = AssistanceState.Error(errorMessage: error.localizedDescription)
                    
                    }
                    
                } receiveValue: { answer in
                    self.assistanceState = AssistanceState.Loaded(text: answer.translated_text)
                }
                .store(in: &self.cancellable)

        case .CodeAssistance:
            print("CodeAssistance")
            self.assistanceRepo.getCode(text: text)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("")
                    case .failure(let error):
                        self?.assistanceState = AssistanceState.Error(errorMessage: error.localizedDescription)
                    
                    }
                } receiveValue: { answer in
                    self.assistanceState = AssistanceState.Loaded(text: answer.code_assistance)
                        
                }
                .store(in: &self.cancellable)

        case .EmailReply:
            print("EmailReply")
            self.assistanceRepo.getEmailReply(text: text)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("")
                    case .failure(let error):
                        self?.assistanceState = AssistanceState.Error(errorMessage: error.localizedDescription)
                    
                    }
                } receiveValue: { answer in
                    self.assistanceState = AssistanceState.Loaded(text: answer.reply_email)
                        
                }
                .store(in: &self.cancellable)
        }
        
    }
    
}


