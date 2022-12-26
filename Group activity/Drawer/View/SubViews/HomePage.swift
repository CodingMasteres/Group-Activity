//
//  HomePage.swift
//  Drawer
//
//  Created by admin on 28/05/1444 AH.
//

import SwiftUI

struct HomePage: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @State var text = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color")
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        
                        Text("All")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(productList, id: \.id) { product in
                                    ProductCard(product: product)
                                    
                                        .environmentObject(cartManager)
                                }
                                
                                .padding()
                                
                                
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Chairs")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                
                                ForEach(ChairList, id: \.id) { product in
                                    ProductCard(product: product)
                                    
                                        .environmentObject(cartManager)
                                }
                                
                                .padding()
                                
                                
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Table")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                
                                ForEach(TableList, id: \.id) { product in
                                    ProductCard(product: product)
                                    
                                        .environmentObject(cartManager)
                                }
                                
                                .padding()
                                
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Mirror")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                
                                ForEach(MirrorList, id: \.id) { product in
                                    ProductCard(product: product)
                                    
                                        .environmentObject(cartManager)
                                }
                                
                                .padding()
                                
                            }
                        }
                        
                    }
                    
                    

                    .navigationTitle(Text("Furniture Shop"))
                    .searchable(text: $text)
                    .padding()
                    
                    
                    
                    .foregroundColor(Color("Blue"))
                    
                    .toolbar {
                        
                        NavigationLink {
                            
                            CartView()
                                .environmentObject(cartManager)
                        } label: {
                            CartButton(numberOfProducts: cartManager.products.count)
                        }
                        
                    }}

            }


        
    

    .navigationViewStyle(StackNavigationViewStyle())
            }
        
        
        }
    }


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
