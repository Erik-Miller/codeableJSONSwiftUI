//
//  ImageLoader.swift
//  codeableJSONSwiftUI
//
//  Created by Erik Miller on 5/2/20.
//  Copyright © 2020 Erik Miller. All rights reserved.
//

//import SwiftUI
//
//class ImageLoader: BindableObject {
//    var didChange = PassthroughSubject<Data, Never>()
//
//    var data = Data() {
//        didSet {
//            didChange.send(data)
//        }
//    }
//        init(imageUrl: String){
//
//        }
//    }
//
//
//
//
//struct ImageViewWidget: View {
//
//    @ObjectBinding var imageLoader: ImageLoader
//
//    init(artworkUrl100: String){
//        ImageLoader = ImageLoader(imageUrl: artworkUrl100)
//    }
//
//    var body: some View{
//        Image(uiImage: (imageLoader.data.count ==0) ? UIImage(named:"apple") UIImage(data: imageLoader.data)!)
//    }
//}
//
//
