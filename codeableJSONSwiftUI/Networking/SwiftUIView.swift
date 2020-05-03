//
//  SwiftUIView.swift
//  codeableJSONSwiftUI
//
//  Created by Erik Miller on 5/2/20.
//  Copyright © 2020 Erik Miller. All rights reserved.
//

import SwiftUI

func loadData(){
       guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
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
