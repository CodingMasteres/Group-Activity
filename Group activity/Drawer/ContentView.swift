//
//  ContentView.swift
//  Drawer
//
//  Created by bayan batawi on 30/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignInAndSignUp()
        //Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Bedroom mirror", image: "M5", price: 74),
                   Product(name: "Modern chair", image: "Chair2", price: 89),
                   Product(name: "Black & Whait", image: "Chair3", price: 79),
                   Product(name: "Rest chair", image: "Chair4", price: 94),
                   Product(name: "Cream sofa", image: "Chair5", price: 99),
                   Product(name: "Small table", image: "T6", price: 20),
                   Product(name: "Brown table", image: "T2", price: 34),
                   Product(name: "Black table", image: "T3", price: 49),
                   Product(name: "Black & small", image: "T4", price: 29),
                   Product(name: "Black & two roof", image: "T5", price: 59),Product(name: "Oval shape", image: "M1", price: 39),
                   Product(name: "Rectangle shape", image: "M2", price: 49),
                   Product(name: "Black Mirror", image: "M3", price: 69),
                   Product(name: "Winding mirror", image: "M4", price: 89),
                   Product(name: "White sofa", image: "Chair1", price: 54),

                ]

var ChairList = [Product(name: "White sofa", image: "Chair1", price: 54),
                 Product(name: "Modern chair", image: "Chair2", price: 89),
                 Product(name: "Black & Whait", image: "Chair3", price: 79),
                 Product(name: "Rest chair", image: "Chair4", price: 94),
                 Product(name: "Cream sofa", image: "Chair5", price: 99),
                 
              ]

var TableList = [Product(name: "Small table", image: "T6", price: 20),
                 Product(name: "Brown table", image: "T2", price: 34),
                 Product(name: "Black table", image: "T3", price: 49),
                 Product(name: "Black & small", image: "T4", price: 29),
                 Product(name: "Black & two roof", image: "T5", price: 59),
                 
              ]
var MirrorList = [Product(name: "Oval shape", image: "M1", price: 39),
                 Product(name: "Rectangle shape", image: "M2", price: 49),
                 Product(name: "Black Mirror", image: "M3", price: 69),
                 Product(name: "Winding mirror", image: "M4", price: 89),
                 Product(name: "Bedroom mirror", image: "M5", price: 74),
                 
              ]


