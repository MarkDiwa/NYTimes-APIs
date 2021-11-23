//
//  TopStoriesAPI.swift
//  nytimes
//
//  Created by Mark Dennis Diwa on 11/23/21.
//

import Alamofire

private enum TopStoriesRequest: RequestConvertible {
    
    case getStories(category: StoryCategory)
    
    var path: String {
        var storyPath = "/svc/topstories/v2"
        switch self {
        case .getStories(let category):
            storyPath += "/\(category.rawValue).json"
        }
        return storyPath
    }
    
    var method: HTTPMethod {
        switch self {
        case .getStories:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getStories:
            return ["api-key": apiKey]
        }
    }
    
}

enum TopStoriesAPI {
    
    static func getStories(category: StoryCategory,
                           completion:  @escaping (AFDataResponse<TopStories>) -> Void) {
        AF.request(TopStoriesRequest.getStories(category: category)).responseDecodable(of: TopStories.self,
                                                                                       completionHandler: completion)
    }
    
}
