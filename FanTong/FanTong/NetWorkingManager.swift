//
//  NetWorkingManager.swift
//  FanTong
//
//  Created by liuk on 16/3/10.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
import AFNetworking
public enum HttpMethod: String{
    case GET, POST, DELETE
}
class NetWorkingManager: NSObject, NSXMLParserDelegate {
    static let shareInstance = NetWorkingManager()
    
    func requestData(httpMethod:HttpMethod,params: NSDictionary? = nil, urlString: String, complete: (NSData)->()){
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let manager = AFHTTPSessionManager(sessionConfiguration: config)
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()
        if httpMethod == .GET{
            let dataTask = manager.GET(urlString, parameters: params, progress: nil, success: { (task, data) -> Void in
                complete(data as! NSData)
                }) { (task, error) -> Void in
                print("error: ----------- \(error)")
            }
            dataTask?.resume()

        }else if httpMethod == .POST{
            let dataTask = manager.POST(urlString, parameters: params, progress: nil, success: { (task, data) -> Void in
                complete(data as! NSData)
                }, failure: { (task, error) -> Void in
                print(error)

            })
            dataTask?.resume()
        }

    }
    
    
//    func requestData(urlString: String, complete: (NSData) -> ()){
//        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
//        let manager = AFHTTPSessionManager(sessionConfiguration: config)
//        manager.requestSerializer = AFHTTPRequestSerializer()
//        manager.responseSerializer = AFHTTPResponseSerializer()
//
//        let url = NSURL(string: urlString)
//        let request = NSMutableURLRequest(URL: url!)
//        request.HTTPMethod = "GET"
//        request.setValue("application/xml", forHTTPHeaderField: "content-type")
//        var string:NSString = ""
//        let dataTask = manager.dataTaskWithRequest(request) { (response, data, error) -> Void in
//            if error == nil{
//                string = NSString(data: data as! NSData, encoding: NSUTF8StringEncoding)!
//                complete(string)
//
//            }else{
//                print("error: -----\(error)")
//            }
//        }
//        dataTask.resume()
//
//    }
    func parserDidStartDocument(parser: NSXMLParser) {
        print("start")
    }
    func parser(parser: NSXMLParser, elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        print(attributeDict)
    }
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        print(string)

    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print(qName)
    }
    func parserDidEndDocument(parser: NSXMLParser) {
        print("end")
    }

}
