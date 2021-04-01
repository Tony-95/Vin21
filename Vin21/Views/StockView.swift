//
//  StockView.swift
//  Vin21
//
//  Created by Tony osei on 12/02/2021.
//

import SwiftUI

struct StockView: View {
    @ObservedObject var model: Model

    var body: some View {
            NavigationView {
                Text("SwiftUI")
                    .navigationTitle("Welcome")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button("About") {
                                print("About tapped!")
                            }

                            Button("Help") {
                                print("Help tapped!")
                            }
                        }
                    }
            }
        }
}


struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        StockView(model: model)
    }
}
