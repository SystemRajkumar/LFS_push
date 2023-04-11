//
//  ContentView.swift
//  MyApp
//
//  Created by Rajkumar Kumawat on 24/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var postData = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(showsIndicators: false){
                ForEach(postData.posts, id: \.id){ i in
                    VStack(alignment: .leading) {
                        Text(i.title).fontWeight(.bold)
                        Text(i.body)
                        Divider()
                    }
                }
            }.onAppear{
                postData.fetchPosts()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
