//
//  MenuButton.swift
//  Drawer
//
//  Created by bayan batawi on 30/05/1444 AH.
//

import SwiftUI

struct MenuButton: View {
    
    var name: String
    var image: String
    @Binding var selectedMenu: String
    
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                selectedMenu = name
            }
            
        }, label: {
            
            HStack(spacing: 15){
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selectedMenu == name ? .black : .white)
                Text(name)
                    .foregroundColor(selectedMenu == name ? .black : .white)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(width: 200 , alignment: .leading)
            
//            .background(Color.white.opacity(selectedMenu == name ? 0 : 1))
            .background(
                ZStack{
                    if selectedMenu == name {
                        Color.white
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: "TAP", in: animation)
                    }
                    else{
                        Color.clear
                    }
                }
            )
//            .cornerRadius(14)
        })
    }
}

struct MenuButton_Previews: PreviewProvider {
    @State static var name: String = ""
    @State static var email: String = ""
    static var previews: some View {
        Home(name: $name, email: $email)
    }
}
