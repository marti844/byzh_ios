//
//  WebService.swift
//  twt
//
//  Created by Kean Shi on 2022/3/2.
//

import Foundation
import SwiftUI
//#if canImport(FoundationNetworking)
//import FoundationNetworking
//#endif

enum AuthenticationError: Error {
    case invaliCrentials
    case custom(errorMessage: String)
}

struct LoginRequestBody: Codable {
    let id: String
    let pwd: String
    let nickname: String
    let gender: String
    let qq: String
    let wechat: String
    let major: String
    let campus: String
    let heading: String
}

struct LoginResponse: Codable {
    let token: String?
    let flag: Bool?
    let data: [LoginRequestBody]
}


//class Webservice {

    
//    var semaphore = DispatchSemaphore (value: 0)

//    let parameters = [
//    ] as [[String : Any]]
//
//    let boundary = "Boundary-\(UUID().uuidString)"
//    var body = ""
//    var error: Error? = nil

//    for param in parameters {
//        if param["disabled"] == nil {
//            let paramName = param["key"]!
//            body += "--\(boundary)\r\n"
//            body += "Content-Disposition:form-data; name=\"\(paramName)\""
//            if param["contentType"] != nil {
//                body += "\r\nContent-Type: \(param["contentType"] as! String)"
//            }
//            let paramType = param["type"] as! String
//            if paramType == "text" {
//                let paramValue = param["value"] as! String
//                body += "\r\n\r\n\(paramValue)\r\n"
//            } else {
//                let paramSrc = param["src"] as! String
//                let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
//                let fileContent = String(data: fileData, encoding: .utf8)!
//                body += "; filename=\"\(paramSrc)\"\r\n"
//                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
//            }
//        }
//    }

//    func login(id: String, pwd: String, completion: @escaping (Result<String, AuthenticationError> ) -> Void) {
//
//        guard let url = URL(string: "http://180.76.100.8/users") else {
//            completion(.failure(.custom(errorMessage: "error")))
//            return
//        }
//
//        let body = LoginRequestBody(id: id, pwd: pwd)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            guard let data = data, error == nil else {
//                completion(.failure(.custom(errorMessage: "no data")))
//                return
//            }
//
//            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
//                completion(.failure(.invaliCrentials))
//                return
//            }
//
//            guard let token = loginResponse.token else {
//                completion(.failure(.invaliCrentials))
//                return
//            }
//
//            completion(.success(token))
//
//        }.resume()
//    }

//    var semaphore = DispatchSemaphore (value: 0)
//
//    let parameters = [
//    ] as [[String : Any]]
//
//    let boundary = "Boundary-\(UUID().uuidString)"
//    var body = ""
//    var error: Error? = nil
//    for param in parameters {
//      if param["disabled"] == nil {
//        let paramName = param["key"]!
//        body += "--\(boundary)\r\n"
//        body += "Content-Disposition:form-data; name=\"\(paramName)\""
//        if param["contentType"] != nil {
//          body += "\r\nContent-Type: \(param["contentType"] as! String)"
//        }
//        let paramType = param["type"] as! String
//        if paramType == "text" {
//          let paramValue = param["value"] as! String
//          body += "\r\n\r\n\(paramValue)\r\n"
//        } else {
//          let paramSrc = param["src"] as! String
//          let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
//          let fileContent = String(data: fileData, encoding: .utf8)!
//          body += "; filename=\"\(paramSrc)\"\r\n"
//            + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
//        }
//      }
//    }
//    body += "--\(boundary)--\r\n";
//    let postData = body.data(using: .utf8)
//
//    var request = URLRequest(url: URL(string: "180.76.100.8/users/login/{id}/{pwd}")!,timeoutInterval: Double.infinity)
//    request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//    request.httpMethod = "GET"
//    request.httpBody = postData
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//      guard let data = data else {
//        print(String(describing: error))
//        semaphore.signal()
//        return
//      }
//      print(String(data: data, encoding: .utf8)!)
//      semaphore.signal()
//    }
//
//    task.resume()
//    semaphore.wait()
//
//}


struct getNetwork {
    static func get(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let queue = DispatchQueue(label: "network", attributes: .concurrent)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            print(Thread.current)
            if let data = data {
                DispatchQueue.main.async {
                    print(Thread.current)
                    completion(.success(data))
                }
            }
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        
        queue.async {
            session.resume()
        }
    }
}


//struct MutiNetwork {
//    enum Method: String {
//        case get = "GET"
//        case post = "POST"
//        case put = "PUT"
//        case delete = "DELETE"
//    }
//
//    static func request(url: URL, method: Method = .get, headers: [String: String] = [:], formdata: [String:String] = [:],completion: @escaping (Result<Data, Error>) -> Void) {
//        var req = URLRequest(url: url)
//
//        if !headers.isEmpty {
//            for (k, v) in headers {
//                req.setValue(v, forHTTPHeaderField: k)
//            }
//        }
//
//        if method == .post || method == .put {
//            var bodyData = Data()
//            let boundary = "Boundary+\(arc4random())\(arc4random())"
//            req.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//            for (key, value) in formdata {
//                bodyData.appendString(string: "--\(boundary)\r\n")
//                bodyData.appendString
//            }
//        }
//    }
//}

struct registerID {
    
    
    
}
