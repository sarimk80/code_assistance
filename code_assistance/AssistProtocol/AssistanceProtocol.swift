//
//  AssistanceProtocol.swift
//  code_assistance
//
//  Created by sarim khan on 07/04/2025.
//

import Combine

protocol AssistanceProtocol{
    
    func getTranslatedText (text:String) -> AnyPublisher<AssisResponse,Error>
    
    func getCode(text:String) -> AnyPublisher<CodeResponse,Error>
    
    func getEmailReply(text:String) -> AnyPublisher<EmailResponse,Error>
    
}
