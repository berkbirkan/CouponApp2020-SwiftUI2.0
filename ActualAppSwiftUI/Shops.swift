//
//  Shops.swift
//  ActualAppSwiftUI
//
//  Created by berk birkan on 9.07.2020.
//  Copyright © 2020 berk birkan. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct Shops: View {
    
    func getCategories(){
        guard let url = URL(string: CATEGORİES) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                print(jsonResponse) //Response result
                let result = jsonResponse as! [String:Any]
                let categories = result["NewsApp"] as! [[String:Any]]
                for category in categories{
                    let newCategory = Category()
                    newCategory.cid = category["cid"] as! String
                    newCategory.image = CATEGORY_IMAGE +  (category["category_image"] as! String)
                    newCategory.name = category["category_name"] as! String
                    self.categories.append(newCategory)
                }
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
    }
    
    @State var categories = [Category]()
    var body: some View {
        NavigationView{
            List(self.categories, id: \.cid) { post in
                
                
                NavigationLink(destination: ShopCatalogs(category: post)) {
                    CategoryCell(category: post)
                }
                    
            }.onAppear(){
                self.categories.removeAll()
                self.getCategories()
                
            }.navigationBarTitle("Shops")
                
        }
    }
}

struct Shops_Previews: PreviewProvider {
    static var previews: some View {
        Shops()
    }
}

struct CategoryCell: View {
    @State var category = Category()
    var body: some View{
        HStack{
            WebImage(url: URL(string: category.image)).resizable().frame(width: 100,height: 100).cornerRadius(16.00)
            Text(category.name)
        }
    }
}
