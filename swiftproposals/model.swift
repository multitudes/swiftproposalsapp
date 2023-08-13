//
//  model.swift
//  swiftproposals
//
//  Created by Laurent B on 13/08/2023.
//

import Foundation

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    //decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

// MARK: - Proposals

// this would have been a good idea but it is not decodable so I will use later if I wnt to decouple the model from the viewmodel
//struct Identifier<Holder>: Decodable, Equatable, Identifiable {
//    let id: UUID
//}
//var id: Identifier<Self> = Identifier(id: UUID())`


struct Proposal: Codable, Equatable, Identifiable {
    static let dataURL = URL(string: "https://download.swift.org/swift-evolution/proposals.json")
    
    let id: String
    let authors: [Profile]

    var title: String
    var link: String
    var status: Status

    struct Status: Codable, Equatable {
        var state: String
        let version: String?
    }
    let reviewManager: Profile
    let sha: String
    let summary: String
    let trackingBugs: [Assignee]?
    let warnings: [Warning]?
}

//MARK: - Profile
struct Profile: Codable, Equatable {
    let link: String // ex = "https:\/\/github.com\/DougGregor"
    let name: String
}

//MARK - Status
struct Status: Codable, Equatable {
    let state: String  //".implemented",
    let version: String
}
// for later
enum State: String, Codable {
    case implemented
}

//MARK - Assignee
struct Assignee: Codable, Equatable {
    let assignee: String
    let id: String
    let link: String // "https:\/\/bugs.swift.org\/browse\/SR-344",
    let radar: String
    let resolution: String // ""
    let status: String
    let title: String
    let updated: String
}

//MARK - Warning
struct Warning: Codable, Equatable {
    let kind: String
    let message: String // "Missing review manager.",
    let stage: String //"parse"
}

/*
 
# example Json
[
  {
    "authors" : [
      {
        "link" : "https:\/\/github.com\/DougGregor",
        "name" : "Doug Gregor"
      }
    ],
    "id" : "SE-0001",
    "link" : "0001-keywords-as-argument-labels.md",
    "reviewManager" : {
      "link" : "",
      "name" : ""
    },
    "sha" : "cd0c7279af644b38860afaa6e0dba74a1d82107a",
    "status" : {
      "state" : ".implemented",
      "version" : "2.2"
    },
    "summary" : "Argument labels are an important part of the interface of a Swift function,\ndescribing what particular arguments to the function do and improving\nreadability. Sometimes, the most natural label for an argument coincides with a\nlanguage keyword, such as `in`, `repeat`, or `defer`. Such keywords should be\nallowed as argument labels, allowing better expression of these interfaces.\n",
    "title" : " Allow (most) keywords as argument labels\n",
    "trackingBugs" : [
      {
        "assignee" : "",
        "id" : "SR-344",
        "link" : "https:\/\/bugs.swift.org\/browse\/SR-344",
        "radar" : "",
        "resolution" : "",
        "status" : "",
        "title" : "",
        "updated" : ""
      }
    ],
    "warnings" : [
      {
        "kind" : "warning",
        "message" : "Missing review manager.",
        "stage" : "parse"
      }
    ]
  },
]

*/
