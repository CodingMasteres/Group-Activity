//
//  CartView.swift
//  ordering
//
//  Created by Wadha Alkhaldi on 30/05/1444 AH.
//


import SwiftUI
struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        ZStack{
            Color("Color")
                .ignoresSafeArea()
            ScrollView {
                if cartManager.paymentSuccess {
                    Text("Thanks for your purchase.")
                        .padding()
                } else {
                    if cartManager.products.count > 0 {
                        ForEach(cartManager.products, id: \.id) { product in
                            ProductRow(product: product)
                        }
                        
                        HStack {
                            Text("Your cart total is")
                            Spacer()
                            Text("$\(cartManager.total).00")
                                .bold()
                        }
                        .padding()
                        
                        PaymentButton(action: cartManager.pay)
                            .padding()
                        
                    } else {
                        Text("Your cart is empty.")
                    }
                }
            }
            .navigationTitle(Text("My Cart"))
            //.navigationBarBackButtonHidden(true)
            .padding(.top)
            .onDisappear {
                if cartManager.paymentSuccess {
                    cartManager.paymentSuccess = false
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}

