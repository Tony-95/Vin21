//
//  ContentView.swift
//  Vin21
//
//  Created by Etienne Vautherin on 08/02/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model: Model
    
    // Etat définissant l'affichage de la vue de login
    @State var isShowingLogin: Bool
    
    var body: some View {
        TabView {
            HomeView(model: model, isShowingLogin: model.noSignedUser)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Accueil")
                }
            
         
            Text("Bookmark Tab")
            StockView(model: model)
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Ma cave")
                }
         
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Mes vins")
                }
         
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Recherche")
                }
        }    }
}
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        return ContentView(model: model, isShowingLogin: model.noSignedUser)
    }
}
