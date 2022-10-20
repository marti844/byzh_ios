//
//  UserData.swift
//  twt
//
//  Created by Kean Shi on 2022/2/13.
//
import SwiftUI

class UserModel: ObservableObject {

    @Published var nickname: String = "地狱犬"
    @Published var gender: String = "男"
    @Published var qq: String = "12344"
    @Published var wechat: String = "12345"
    @Published var pwd: String = ""
    @Published var major: String = "马克思"
    @Published var campus: String = "加州分校"
    @Published var heading: String = "jjj"
    
    func changename(newname: String) {
        self.nickname = newname
    }
}

// MARK: - PostResponse
struct PostResponse: Codable {
    let flag: Bool?
    let data: [Post]?
    
}

// MARK: - Post
struct Post: Codable {
    let id: Int?
    let postTime, content, posterID, startLocation: String?
    let destination, posterName, deadTime: String?
    let year, month, day, hour: Int?
    let minute, teamID, flag: Int?

    enum CodingKeys: String, CodingKey {
        case id, postTime, content
        case posterID = "posterId"
        case startLocation, destination, posterName, deadTime, year, month, day, hour, minute
        case teamID = "teamId"
        case flag
    }
}


//MARK: - 整体帖子
class PostModel: UIViewController, ObservableObject{
    
    let base = BaseNetwork(baseURL: URL(string: "http://39.101.75.120:520")!)
    @Published var posts: [Post] = []
    
    func getData() {
        Task {
            do {
                let resp = try await base.get("/posts/flag/0").decoded(type: PostResponse.self)
                posts = resp.data!
            } catch {
                print(error)
            }
        }
    }
}
    
    
    
//MARK: - 搜索帖子
class SearchModel: UIViewController, ObservableObject {
    
    let base = BaseNetwork(baseURL: URL(string: "http://39.101.75.120:520")!)
    @Published var posts: [Post] = []
    
    func ByDes(destination: String?) {
        Task {
            do {
                let resp = try await base.get("/posts/search/destination/\(destination)").decoded(type: PostResponse.self)
                posts = resp.data ?? []
            } catch {
                print(error)
            }
        }
    }
    
    func BySta(startLocation: String?) {
        Task {
            do {
                let resp = try await base.get("/posts/search/startLocation/\(startLocation)").decoded(type: PostResponse.self)
                posts = resp.data ?? []
            } catch {
                print(error)
            }
        }
    }
    
    func ById(id: String?) {
        Task {
            do {
                let resp = try await base.get("/posts/\(id)").decoded(type: PostResponse.self)
                posts = resp.data ?? []
            } catch {
                print(error)
            }
        }
    }
    
    func ByCont(content: String?) {
        Task {
            do {
                let resp = try await base.get("/posts/search/content/\(content)").decoded(type: PostResponse.self)
                posts = resp.data ?? []
            } catch {
                print(error)
            }
        }
    }
    
}


// MARK: - FeedBackResponse
struct FeedBackResponse: Codable {
    let flag: Bool?
    let data: [FeedBack]?
}

// MARK: - FeedBack
struct FeedBack: Codable {
    let id: Int?
    let time, feedbackPersonID, content: String?

    enum CodingKeys: String, CodingKey {
        case id, time
        case feedbackPersonID = "feedbackPersonId"
        case content
    }
}

//MARK: - 反馈
class FeedBackRequset: UIViewController, ObservableObject {
    
    let base = BaseNetwork(baseURL: URL(string: "http://39.101.75.120:520")!)
    
    func feedBack() {
        Task {
            do {
                let resp = try await base.post("/feedback").decoded(type: FeedBackResponse.self)
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - TeamResponse
struct TeamResponse: Codable {
    let flag: Bool?
    let data: [Teams]?
}

// MARK: - Teams
struct Teams: Codable {
    let flag, id: Int?
    let userID, nickName: String?
    let teamID: TeamID?
    let state: Int?
    let heading: String?
    let leaderID: String?

    enum CodingKeys: String, CodingKey {
        case flag, id
        case userID = "userId"
        case nickName
        case teamID = "teamId"
        case state, heading
        case leaderID = "leaderId"
    }
}

enum TeamID: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(TeamID.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TeamID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}


//MARK: - 所有创建/申请加入帖子
//flag = 0:创建。  flag = 1:申请。 
class TeamModel: UIViewController, ObservableObject {
    
    let base = BaseNetwork(baseURL: URL(string: "http://39.101.75.120:520")!)
    @Published var isMine: Bool?
    
    func getTeam(uid: String) {
        Task {
            do {
                let resp = try await base.get("/teams/message/\(uid)").decoded(type: TeamResponse.self)
                isMine = resp.flag!
            } catch {
                print(error)
            }
        }
    }
}


// MARK: - UserResponse
struct UserResponse: Codable {
    let flag: Bool?
    let data: [User]?
}

// MARK: - User
struct User: Codable {
    let id, nickname: String?
    let gender: Gender?
    let qq, wechat, pwd, major: String?
    let campus: Campus?
    let heading: String?
}

enum Campus: String, Codable {
    case x = "X"
}

enum Gender: String, Codable {
    case f = "F"
    case m = "M"
}


//MARK: - 注册/更改个人信息
class RegisterModel: UIViewController, ObservableObject {
    
    let base = BaseNetwork(baseURL: URL(string: "http://39.101.75.120:520")!)
    
    func Register() {
        Task {
            do {
                let resp = try await base.post("users/register").decoded(type: UserResponse.self)
            } catch{
                print(error)
            }
        }
    }
}

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let flag: Bool?
    let data: [LoginClass]
}

// MARK: - DataClass
struct LoginClass: Codable {
    let id, nickname, gender, qq: String?
    let wechat, pwd, major, campus: String?
    let heading: String?
}


//MARK: - 登录
class LoginModel: UIViewController, ObservableObject {
    
    @Published var isExist: Bool?
    @Published var userinfo: [LoginClass] = []
    let base = BaseNetwork(baseURL: URL(string: "http://39.101.75.120:520")!)
    
    func Login(id: String, pwd: String) {
        Task {
            do {
                let resp = try await base.get("/users/login/\(id)/\(pwd)").decoded(type: LoginResponse.self)
                isExist = resp.flag ?? false
                userinfo = resp.data
            } catch {
                print(error)
            }
        }
    }
}
