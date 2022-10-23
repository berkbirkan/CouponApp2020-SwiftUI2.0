//
//  LastCatalogs.swift
//  ActualAppSwiftUI
//
//  Created by berk birkan on 9.07.2020.
//  Copyright © 2020 berk birkan. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct LastCatalogs: View {
    func getPosts(){
        guard let url = URL(string: LATEST_NEWS) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                if let result = jsonResponse as? [String:Any]{
                    let posts = result["NewsApp"] as! [[String:Any]]
                    for post in posts{
                        let newPost = Post()
                        newPost.cat_id = post["cat_id"] as! String
                        newPost.category_image = post["category_image"] as! String
                        newPost.category_name = post["category_name"] as! String
                        newPost.cid = post["cid"] as! String
                        newPost.news_date = post["news_date"] as! String
                        newPost.news_description = post["news_description"] as! String
                        newPost.news_heading = post["news_heading"] as! String
                        newPost.news_image = IMAGE + (post["news_image"] as! String)
                        newPost.nid = post["nid"] as! String
                        self.posts.append(newPost)
                    }
                }
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
    }
    @State var posts = [Post]()
    var body: some View {
        NavigationView{
            
            
            
            List(self.posts, id: \.nid) { post in
                
                
                NavigationLink(destination: NewsDetail(post: post)) {
                    PostCell(post: post)
                }
                    
            }.onAppear(){
                self.posts.removeAll()
                self.getPosts()
                
            }.navigationBarTitle("Catalogs")
        }
        
    }
}

struct LastCatalogs_Previews: PreviewProvider {
    static var previews: some View {
        LastCatalogs()
    }
}
struct PostCell: View {
    @State var post = Post()
    var body: some View{
        HStack{
            WebImage(url: URL(string: post.news_image)).resizable().frame(width: 100,height: 100).cornerRadius(16.00)
            VStack(alignment: .leading){
                Text(post.news_heading).fontWeight(.bold)
                Text(parseHTMLText(html: post.news_description)).lineLimit(2).foregroundColor(Color.gray)
                
                HStack{
                    Image(systemName: "calendar")
                    Text(post.news_date).foregroundColor(Color.gray)
                }
                
                HStack{
                    Image(systemName: "list.dash")
                    Text(post.category_name).foregroundColor(Color.gray)
                }
                
            }
        }
    }
}
