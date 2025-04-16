//
//  AssistanceRepo.swift
//  code_assistance
//
//  Created by sarim khan on 07/04/2025.
//

import Combine
import Foundation

class AssistanceRepo:AssistanceProtocol{
    
    let baseUrl = "http://127.0.0.1:8000/"
    
    
    
    func getTranslatedText(text: String) -> AnyPublisher<AssisResponse, any Error> {
        
        guard let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        
      

        var request = URLRequest(url: URL(string: "\(baseUrl)translation/\(encodedText)")!,timeoutInterval: .infinity)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map({$0.data})
            .decode(type: AssisResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getCode(text: String) -> AnyPublisher<CodeResponse, any Error> {
        

        var request = URLRequest(url: URL(string: "\(baseUrl)code_assistance/\(text)")!,timeoutInterval: .infinity)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map({$0.data})
            .decode(type: CodeResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getEmailReply(text: String) -> AnyPublisher<EmailResponse, any Error> {
        

        var request = URLRequest(url: URL(string: "\(baseUrl)email_reply/\(text)")!,timeoutInterval: .infinity)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map({$0.data})
            .decode(type: EmailResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}

