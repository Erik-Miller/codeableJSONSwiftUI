//
//  ContentView.swift
//  codeableJSONSwiftUI
//
//  Created by Erik Miller on 5/2/20.
//  Copyright © 2020 Erik Miller. All rights reserved.
//
import Combine
import SwiftUI

struct Response: Codable{
    var results: [Result]
}
struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artworkUrl100: String
    
}




struct ContentView: View {
    @State var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) {item in
            VStack(alignment: .leading){
                HStack{
                    //Image(uiImage: item.artworkUrl100)
                    
                    Text(item.artworkUrl100)
                }
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
                
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData(){
        guard let url = URL(string: "https://itunes.apple.com/search?term=ti&entity=song") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){DispatchQueue.main.async {
                    self.results = decodedResponse.results
                    }
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
