//
//  HTMLParser.swift
//  ActualAppSwiftUI
//
//  Created by berk birkan on 9.07.2020.
//  Copyright © 2020 berk birkan. All rights reserved.
//

import Foundation
import SwiftSoup


func parsehtmlimage(content: String)->[String]{
    do {
        let doc: Document = try SwiftSoup.parse(content)
        let srcs: Elements = try doc.select("img[src]")
        let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
        // do something with srcsStringArray
        return srcsStringArray as! [String]
    } catch Exception.Error(_, let message) {
        print(message)
    } catch {
        print("error")
    }
    return []
    
}

func parseHTMLText(html:String)->String{
    do {
       let doc: Document = try SwiftSoup.parse(html)
       return try doc.text()
    } catch Exception.Error(let type, let message) {
        print(message)
        print(type)
        return ""
    } catch {
        print("error")
        return ""
    }
}
