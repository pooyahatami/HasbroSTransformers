//
//  Transformer.swift
//  HasbroSTransformers
//
//  Created by Pooya on 2018-09-22.
//  Copyright © 2018 Amir. All rights reserved.
//
import Foundation

struct Transformer: Encodable & Decodable {
    var id: String
    var name: String
    var team : String
    var strength : Int
    var intelligence : Int
    var speed : Int
    var endurance : Int
    var rank : Int
    var courage : Int
    var firepower : Int
    var skill : Int
    var team_icon: String
    
    init(json: [String: Any]) {
        id = json["id"] as? String ??  ""
        name = json["name"] as? String ?? ""
        team = json["team"] as? String ?? ""
        strength = json["strength"] as? Int ?? 0
        intelligence = json["intelligence"] as? Int ?? 0
        speed = json["speed"] as? Int ?? 0
        endurance = json["endurance"] as? Int ?? 0
        rank = json["rank"] as? Int ?? 0
        courage = json["courage"] as? Int ?? 0
        firepower = json["firepower"] as? Int ?? 0
        skill = json["skill"] as? Int ?? 0
        team_icon = json["team_icon"] as? String ?? ""
    }
    
    init(make: String ) {
        
        if make == "EMPTY" {
            id = ""
            name = ""
            team = ""
            strength = 0
            intelligence =  0
            speed =  0
            endurance =  0
            rank =  0
            courage =  0
            firepower =  0
            skill =  0
            team_icon = ""
        } else if ( make == "BestA" ) {
            id = ""
            name = "TheBestA"
            team = "A"
            strength = 10
            intelligence =  10
            speed =  10
            endurance =  10
            rank =  10
            courage =  10
            firepower =  10
            skill =  10
            team_icon = ""
        } else if ( make == "BestD" ) {
            id = ""
            name = "TheBestD"
            team = "A"
            strength = 10
            intelligence =  10
            speed =  10
            endurance =  10
            rank =  10
            courage =  10
            firepower =  10
            skill =  10
            team_icon = ""
        } else {
            id = ""
            name = ""
            team = ""
            strength = 0
            intelligence =  0
            speed =  0
            endurance =  0
            rank =  0
            courage =  0
            firepower =  0
            skill =  0
            team_icon = ""
        }
    }
    
    func toJson() -> [String : Any] {
        return [
            "id": self.id,
            "name": self.name,
            "team": self.team,
            "strength": self.strength,
            "intelligence": self.intelligence,
            "speed": self.speed,
            "endurance": self.endurance,
            "rank": self.rank,
            "courage": self.courage,
            "firepower": self.firepower,
            "skill": self.skill
        ]
    }

    func amIWinnerVS(vsTransformer : Transformer) -> String {
        var amIWin : String = "tie"
        let mySelfOverall =  ( self.strength +
                            self.intelligence +
                            self.speed +
                            self.endurance +
                            self.rank +
                            self.courage +
                            self.firepower +
                            self.skill ) / 8
        let vsOverall = ( vsTransformer.strength +
                            vsTransformer.intelligence +
                            vsTransformer.speed +
                            vsTransformer.endurance +
                            vsTransformer.rank +
                            vsTransformer.courage +
                            vsTransformer.firepower +
                            vsTransformer.skill ) / 8

//        if (self.name.lowercased() == "optimus prime"  )
        
        if (vsTransformer.name.lowercased() == "optimus prime" &&
            self.name.lowercased() != "predaking" &&
            self.name.lowercased() != vsTransformer.name.lowercased()) {
            amIWin = "lose"
        } else if (self.name.lowercased() == "optimus prime" &&
            vsTransformer.name.lowercased() != "predaking" &&
            vsTransformer.name.lowercased() != self.name.lowercased()) {
            amIWin = "win"
        } else if (self.name.lowercased() == "predaking" &&
            vsTransformer.name.lowercased() != "optimus prime" &&
            vsTransformer.name.lowercased() != self.name.lowercased()) {
            amIWin = "win"
        } else if (vsTransformer.name.lowercased() == "predaking" &&
            self.name.lowercased() != "optimus prime" &&
            self.name.lowercased() != vsTransformer.name.lowercased()) {
            amIWin = "lose"
        } else if (self.name.lowercased() == vsTransformer.name.lowercased() ||
            ( self.name.lowercased() == "predaking" &&
                vsTransformer.name.lowercased() == "optimus prime") || ( vsTransformer.name.lowercased() == "predaking" &&
                    self.name.lowercased() == "optimus prime") ) {
            amIWin = "gameover"
        } else if (self.courage >= vsTransformer.courage + 4 && self.strength >=  vsTransformer.strength + 3 ) {
            amIWin = "win"
        } else if (self.courage >= vsTransformer.courage + 4 && self.strength >=  vsTransformer.strength + 3 ) {
            amIWin = "win"
        } else if (self.courage >= vsTransformer.courage + 4 && self.strength >=  vsTransformer.strength + 3 ) {
            amIWin = "win"
        } else if (self.courage + 4 < vsTransformer.courage && self.strength + 3 <  vsTransformer.strength ) {
            amIWin = "lose"
        } else if (self.skill >= vsTransformer.skill + 3 ) {
            amIWin = "win"
        } else if (self.skill + 3 < vsTransformer.skill ) {
            amIWin = "lose"
        } else if (mySelfOverall > vsOverall ) {
            amIWin = "win"
        } else if (mySelfOverall < vsOverall ) {
            amIWin = "lose"
        }

        return amIWin
    }

    
//    func amIWinnerVS(vsTransformer : Transformer) -> String {
//        var amIWin : String = "tie"
//
//        if ( checkRules(self, vsTransformer, "rule11") == "win" ) {
//            amIWin = "win"
//        } else if ( checkRules(vsTransformer, self, "rule11") == "win" ) {
//            amIWin = "lose"
//        } else if ( checkRules(self, vsTransformer, "rule12") == "win" ) {
//            amIWin = "win"
//        } else if ( checkRules(vsTransformer, self, "rule12") == "win" ) {
//            amIWin = "lose"
//        } else if (self.courage >= vsTransformer.courage + 4 && self.strength >=  vsTransformer.strength + 3 ) {
//            amIWin = "win"
//        } else if (self.courage + 4 < vsTransformer.courage && self.strength + 3 <  vsTransformer.strength ) {
//            amIWin = "lose"
//        } else if (self.skill >= vsTransformer.skill + 3 ) {
//            amIWin = "win"
//        } else if (self.skill + 3 < vsTransformer.skill ) {
//            amIWin = "lose"
//        } else if (checkRules(self, vsTransformer, "rule4") == "win" ) {
//            amIWin = "win"
//        } else if (checkRules(vsTransformer, self, "rule4") == "win" ) {
//            amIWin = "lose"
//        }
//
//        return amIWin
//    }
    
    
    
    
    func checkRules(_ t1 : Transformer , _ t2 : Transformer , _ ruleName : String) -> String {
        
        var resultCase = "tie"
        
        let t1Overall =  ( t1.strength +
            t1.intelligence +
            t1.speed +
            t1.endurance +
            t1.rank +
            t1.courage +
            t1.firepower +
            t1.skill ) / 8
        let t2Overall = ( t2.strength +
            t2.intelligence +
            t2.speed +
            t2.endurance +
            t2.rank +
            t2.courage +
            t2.firepower +
            t2.skill ) / 8
        
        switch ruleName {
        case "rule11":
            resultCase = (t1.name.lowercased() == "optimus prime" &&
                            t2.name.lowercased() != "predaking" &&
                            t2.name.lowercased() != t1.name.lowercased()) ?
                                "win" : resultCase
                break
        case "rule12":
            resultCase = (t1.name.lowercased() == t2.name.lowercased() ||
                           ( t1.name.lowercased() == "predaking" &&
                            t2.name.lowercased() == "optimus prime")) ?
                                "gameover" : resultCase
                break
        case "rule2":
            resultCase = (t1.courage >= t2.courage + 4 && t1.strength >=  t2.strength + 3 ) ?
                        "win" : resultCase
            break
        case "rule3":
            resultCase = (t1.skill >= t2.skill + 3 ) ?
                "win" : resultCase
            break
        case "rule4":
            resultCase = (t1Overall > t2Overall ) ?
                "win" : resultCase
            break
        default:
            resultCase = ""
            break
        }
        return resultCase
    }
    
    
    
    func getTeamName() -> String {
        return self.team == "A" ? "Autobots" : "Decepticons"
    }
    
    
}


struct TransformerList: Decodable {
    let transformers : [Transformer]
    
    //    subscript(index: Int) -> Transformer {
    //        get {
    //            return transformers[index]
    //        }
    //    }
}


class TransformerTools {
    
    
    
    func separateByFields(transformers : [Transformer] ) -> ([Transformer],[Transformer]) {
        var transformerInternalA : [Transformer] = []
        var transformerInternalD : [Transformer] = []
        
        for onetransformer in transformers {
            if (onetransformer.team == "A") {
                transformerInternalA.append(onetransformer)
            } else if (onetransformer.team == "D") {
                transformerInternalD.append(onetransformer)
            } else {
                // TODO
            }
        }
        //print(transformerA)
        //print(transformerD)
        return ( sortTransformerArray(transformers: transformerInternalA) , sortTransformerArray(transformers: transformerInternalD) )
    }
    
    
    func sortTransformerArray(transformers : [Transformer]) -> [Transformer] {
        return transformers.sorted(by: { $0.rank > $1.rank })
    }
    
    
    func makeBattelsList(transformerA : [Transformer],transformerD : [Transformer] ) -> ([Transformer]) {
        var transformerMainInternal : [Transformer] = []
        let lenA = transformerA.count
        let lenD = transformerD.count
        let emptyTransformer = Transformer.init(make: "EMPTY")
        let lenMax = lenA > lenD ? lenA : lenD
        for index in 0 ..< lenMax {
            if (index < lenA) {
                transformerMainInternal.append(transformerA[index])
            } else {
                transformerMainInternal.append(emptyTransformer)
            }
            
            if (index < lenD) {
                transformerMainInternal.append(transformerD[index])
            } else {
                transformerMainInternal.append(emptyTransformer)
            }
        }
        return transformerMainInternal
    }
    
    
}



//
//
//struct Transformer1: Encodable & Decodable {
//
//    var id: String
//    var name: String?
//    var team : String?
//    var strength : Int?
//    var intelligence : Int?
//    var speed : Int?
//    var endurance : Int?
//    var rank : Int?
//    var courage : Int?
//    var firepower : Int?
//    var skill : Int?
//    var team_icon: String?
//
////    "courage": 9,
////    "endurance": 8,
////    "firepower": 10,
////    "id": "-LMpkJaYntUrnPPWL5xZ",
////    "intelligence": 10,
////    "name": "Megatron",
////    "rank": 10,
////    "skill": 9,
////    "speed": 4,
////    "strength": 10,
////    "team": "D",
////    "team_icon": "https://tfwiki.net/mediawiki/images2/archive/8/8d/20110410191659%21Symbol_decept_reg.png"
//
//    init(json: [String: Any]) {
//        id = json["id"] as? String ??  ""
//        name = json["name"] as? String ?? ""
//        team = json["team"] as? String ?? ""
//        strength = json["strength"] as? Int ?? 0
//        intelligence = json["intelligence"] as? Int ?? 0
//        speed = json["speed"] as? Int ?? 0
//        endurance = json["endurance"] as? Int ?? 0
//        rank = json["rank"] as? Int ?? 0
//        courage = json["courage"] as? Int ?? 0
//        firepower = json["firepower"] as? Int ?? 0
//        skill = json["skill"] as? Int ?? 0
//        team_icon = json["team_icon"] as? String ?? ""
//    }
//
//    func toJson() -> [String : Any] {
//        return [
//            "id": self.id,
//            "name": self.name,
//            "team": self.team,
//            "strength": self.strength,
//            "intelligence": self.intelligence,
//            "speed": self.speed,
//            "endurance": self.endurance,
//            "rank": self.rank,
//            "courage": self.courage,
//            "firepower": self.firepower,
//            "skill": self.skill
//        ]
//
//
//    }
//}

