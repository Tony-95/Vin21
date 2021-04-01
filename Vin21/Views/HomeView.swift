//
//  HomeView.swift
//  Vin21
//
//  Created by Tony osei on 12/02/2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var model: Model
    
    // Etat définissant l'affichage de la vue de login
    @State var isShowingLogin: Bool

    var body: some View {
        VStack {
            
            if (model.user?.email == .none) {
                Text("Hello, world!")
                    .padding()
            
                Button("Sign Out") {
                    model.signOut()
                    
                    // Sign Out sans Future
    //                do {
    //                    try Auth.auth().signOut()
    //                    model.user = .none
    //                } catch {
    //                    print("Sign Out Error: \(error.localizedDescription)")
    //                }
                }.padding()
            
            } else {
                Text("Hello, \(model.user!.email!)")
                    .padding()
            }
            
            //Button("Add Wine") {
                //model.add(wine: Wine.test())
           // }.padding()
            
            //List(model.wines) { wine //in
                //WineView(model: model, wine: wine)
            //}
        }
        // Observation de la valeur de model.user
        // Si user est défini, isShowingLogin prend la valeur false
        // Si user n'est pas défini, isShowingLogin prend la valeur true
        .onChange(of: model.user) { (user) in
            isShowingLogin = model.noSignedUser
        }
        
        // La vue LoginView est affichée par dessus VStack lorsque isShowingLogin est vrai
        .sheet(isPresented: $isShowingLogin) {
            LoginView(model: model)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        
        HomeView(model: model, isShowingLogin: model.noSignedUser)
    }
}
