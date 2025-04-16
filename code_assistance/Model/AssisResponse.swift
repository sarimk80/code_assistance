//
//  AssisResponse.swift
//  code_assistance
//
//  Created by sarim khan on 07/04/2025.
//


struct AssisResponse:Codable{
    let translated_text: String
}

struct CodeResponse:Codable {
    let code_assistance:String
}

struct EmailResponse:Codable {
    let reply_email:String
}
