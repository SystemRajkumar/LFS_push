//
//  ViewModel.swift
//  MyApp
//
//  Created by Rajkumar Kumawat on 24/03/23.
//

import SwiftUI

class ViewModel: ObservableObject {
  @Published var posts = [PostData]()
    
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let posts = try JSONDecoder().decode([PostData].self, from: data)
                    DispatchQueue.main.async {
                        self.posts = posts
                        print(posts)
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct PostData: Codable {
    let id : Int
    let title : String
    let body : String
}
