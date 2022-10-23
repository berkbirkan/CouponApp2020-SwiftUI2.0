//
//  FavoriteView.swift
//  ActualAppSwiftUI
//
//  Created by berk birkan on 9.07.2020.
//  Copyright © 2020 berk birkan. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    
    @State var posts = [Post]()
    var body: some View {
        NavigationView{
            List(self.posts, id: \.nid) { post in
                
                
                NavigationLink(destination: NewsDetail(post: post)) {
                    PostCell(post: post)
                }
                    
            }.onAppear(){
                self.posts.removeAll()
                for favorite in DBManager.sharedInstance.getDataFromDB(){
                    let newPost = Post()
                    newPost.cat_id = favorite.cat_id
                    newPost.category_image = favorite.category_image
                    newPost.category_name = favorite.category_name
                    newPost.cid = favorite.cid
                    newPost.news_date = favorite.news_date
                    newPost.news_description = favorite.news_description
                    newPost.news_heading = favorite.news_heading
                    newPost.news_image = favorite.news_image
                    newPost.nid = favorite.nid
                    newPost.status = favorite.status
                    print(favorite.news_heading)
                    
                    self.posts.append(newPost)
                    
                }
                
            }.navigationBarTitle("Favorites")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
