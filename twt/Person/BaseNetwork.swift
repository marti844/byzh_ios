//
//  BaseNetwork.swift
//  twt
//
//  Created by Kean Shi on 2022/3/15.
//

import Alamofire

enum NetworkError: Error, Equatable, Hashable {
    case urlError, requestFailed, loginFailed, unknownError, alreadyLogin, usorpwWrong, captchaWrong
    case custom(String)
    case `default`
}

struct BaseNetwork {
    var baseURL: URL
//    var interceptor:
    private let session: Session
    
    init(baseURL: URL, adapters: [RequestAdapter] = [], retriers: [RequestRetrier] = []) {
        self.baseURL = baseURL
        let config = URLSessionConfiguration.af.default
        config.timeoutIntervalForRequest = 30
        self.session = Session(configuration: config, interceptor: Interceptor(adapters: adapters, retriers: retriers, interceptors: [RetryPolicy()]))
    }
    
    
    func get(_ url: String,
             relative: Bool = true,
             parameters: [String:Any] = [:],
             headers: [String: String] = [:]) async throws -> Data {
        var requestURL = URL(string: url, relativeTo: self.baseURL)!
        if !relative {
            requestURL = URL(string: url)!
        }
        
        return try await AF.request(requestURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(headers))
            .validate().awaitable()
    }
    
    func post(_ url: String,
              relative: Bool = true,
              data: [String: Any] = [:],
              multiData: [(String, Any)] = [],
              imageFiles: [(String, Data)] = [],
              headers: [String: String] = [:]) async throws -> Data {
        var requestURL = URL(string: url, relativeTo: self.baseURL)!
        if !relative {
            requestURL = URL(string: url)!
        }
        
        return try await AF.upload(multipartFormData: { m in
            for i in data {
                if i.value is Data {
                    m.append(i.value as! Data, withName: i.key)
                } else if i.value is String {
                    m.append(Data((i.value as! String).utf8), withName: i.key)
                }
            }
            /// paras with the same key
            for (key, value) in multiData {
                if value is Data {
                    m.append(value as! Data, withName: key)
                } else if value is String {
                    m.append(Data((value as! String).utf8), withName: key)
                }
            }
            /// upload image files
            for (key, value) in imageFiles {
                m.append(value, withName: key, fileName: "\(arc4random()).jpg", mimeType: "image/jpeg")
            }
        }, to: requestURL, headers: HTTPHeaders(headers))
            .validate().awaitable()
    }
}

extension DataRequest {
    @discardableResult
    func awaitable() async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            self.responseData { response in
//                log(response.debugDescription)
                
                if let data = response.data {
                    continuation.resume(returning: data)
                    return
                }
                if let err = response.error {
                    continuation.resume(throwing: err)
                    return
                }
                fatalError("Error while doing Alamofire url request")
            }
        }
    }
}

extension Data {
    static let dataDecoder = JSONDecoder()
    
    func decoded<T: Decodable>(type: T.Type) throws -> T {
        return try Data.dataDecoder.decode(type, from: self)
    }
    
    func decoded() -> String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}
