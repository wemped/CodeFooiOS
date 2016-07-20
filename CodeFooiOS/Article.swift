//
//  Article.swift
//  CodeFooiOS
//
//  Created by Drake Wempe on 7/19/16.
//  Copyright © 2016 Drake Wempe. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class Article {
    
    let id : String
    let headline : String
    let imageUrl : String
    
    static let BASE_API_URL = ""
    
    init(json : JSON){
        id = json["articleId"].stringValue
        
        let metadata = json["metadata"]
        headline = metadata["headline"].stringValue
        
        let promo = json["promo"]
        let promoImages = promo["promoImages"].arrayValue
        if promoImages.count > 0{
            let promoImage = promoImages[0]
            imageUrl = promoImage["url"].string!
        }else{
            imageUrl = ""
        }
    }

    
    static func getArticles(callback : ([Article]) -> () ){
        
        Alamofire.request(.GET, BASE_API_URL).responseJSON { (response) in
            if let data = response.data{
                let json = JSON(data: data)
                let jsonArray = json["data"].arrayValue
                callback(articlesFrom(jsonArray))
            }
        }
    }
    
    static func articlesFrom(jsonArray: [JSON]) -> [Article]{
        var result = [Article]()
        
        for articleJson in jsonArray{
            result.append(Article(json: articleJson))
        }
        
        return result
    }
    
}