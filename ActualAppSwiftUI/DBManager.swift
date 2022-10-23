//
//  DBManager.swift
//  ActualAppSwiftUI
//
//  Created by berk birkan on 9.07.2020.
//  Copyright © 2020 berk birkan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class DBManager {
    private var   database:Realm
    static let   sharedInstance = DBManager()
    private init() {
       database = try! Realm()
    }
    
    func getindex(inputpost: Post)->Favorite{
        
        for item in getDataFromDB(){
            if item.nid == inputpost.nid{
                return item
            }
            
        }
        return Favorite()
    }
    
    func isFavorite(inputpost: Post)->Bool{
        for post in getDataFromDB(){
            if post.nid == inputpost.nid{
                return true
            }
        }
        return false
    }
    
    //Posts
    
    func getDataFromDB() ->   Results<Favorite> {
      let results: Results<Favorite> =   database.objects(Favorite.self)
      return results
     }
     func addData(object: Favorite)   {
          try! database.write {
             database.add(object)
             print("Added new object")
          }
     }
      func deleteAllFromDatabase()  {
           try!   database.write {
               database.deleteAll()
           }
      }
      func deleteFromDb(object: Favorite)   {
          try!   database.write {
             database.delete(object)
          }
      }
    
    
    
    
}
