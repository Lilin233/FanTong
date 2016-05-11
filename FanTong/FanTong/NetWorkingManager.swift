//
//  NetWorkingManager.swift
//  FanTong
//
//  Created by liuk on 16/3/10.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
class NetWorkingManager: NSObject, NSXMLParserDelegate {
    static let shareInstance = NetWorkingManager()
    
    func requestData(urlString: String, complete: (NSString)->()){
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let manager = AFHTTPSessionManager(sessionConfiguration: config)
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()

        let url = NSURL(string: urlString)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        request.setValue("application/xml", forHTTPHeaderField: "content-type")
        var string:NSString = ""
        let dataTask = manager.dataTaskWithRequest(request) { (response, data, error) -> Void in
            if error == nil{
                print("success: -----\(response )")
                string = NSString(data: data as! NSData, encoding: NSUTF8StringEncoding)!
                print(string)
//                let par = NSXMLParser(data: data as! NSData)
//                par.delegate = self
//                par.parse()
                complete(string)

            }else{
                print("error: -----\(error)")
            }
        }
        dataTask.resume()
    }
    
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
