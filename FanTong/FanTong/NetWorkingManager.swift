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
        manager.responseSerializer.acceptableContentTypes = Set(["application/x-www-form-urlencoded", "application/json"])
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
    
    func updateStatus(urlString: String, params: String){
        let url = NSURL(string: urlString);
        let postBody = NSMutableData()
        postBody.appendData(params.dataUsingEncoding(NSUTF8StringEncoding)!)
        let request = NSMutableURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 20)
        request.HTTPMethod = "POST"
//        request.setValue("OAuth", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postBody;
        let dataa = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        
        print(NSString(data: dataa, encoding: NSUTF8StringEncoding))
        
        
        //        connection
////         
////            [postBody appendData:[@"key1=value1&key2=value2...." dataUsingEncoding:NSUTF8StringEncoding]];
////            NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url
////                                                                     cachePolicy:NSURLRequestReloadIgnoringCacheData
//                                                                 timeoutInterval:20.0f];
//            [request setHTTPMethod: @"POST"];
//            [request setValue: @"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//            [request setHTTPBody:postBody];
//            NSError *error = nil;
//            NSHTTPURLResponse* urlResponse = nil;
//            NSData *responseData = [NSURLConnection sendSynchronousRequest:request
//                                                         returningResponse:&urlResponse error:&error];
//            NSString *result = [[NSString alloc] initWithData:responseData
//                                                     encoding:NSUTF8StringEncoding];
//            NSLog(@"结果：%@",result);
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
