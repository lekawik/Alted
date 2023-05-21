//
//  LoginResponse.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import Foundation

struct LoginResponse: Decodable {
    let accounts: [Account]
    
    enum CodingKeys: CodingKey {
        case accounts
    }
}

struct Account: Decodable {
    let id: Int
    let typeCompte: String
    let main: Bool
    let civilite: String
    let prenom: String
    let particule: String
    let nom: String
    let email: String
    let anneeScolaireCourante: String
    let nomEtablissement: String
    let logoEtablissement: String
    let profile: Profile
    
    enum CodingKeys: CodingKey {
        case id
        case typeCompte
        case main
        case civilite
        case prenom
        case particule
        case nom
        case email
        case anneeScolaireCourante
        case nomEtablissement
        case logoEtablissement
        case profile
    }
}

struct Profile: Decodable {
    let sexe: String
    let nomEtablissement: String
    let idEtablissement: String
    let rneEtablissement: String
    let telPortable: String
    let idReelEtab: String
    let photo: String
    let classe: Classe
    
    enum CodingKeys: CodingKey {
        case sexe
        case nomEtablissement
        case idEtablissement
        case rneEtablissement
        case telPortable
        case idReelEtab
        case photo
        case classe
    }
}

struct Classe: Decodable {
    let id: Int
    let code: String
    let libelle: String
    let estNote: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case libelle
        case estNote
    }
}
