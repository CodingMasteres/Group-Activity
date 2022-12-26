//
//  Home.swift
//  Drawer
//
//  Created by bayan batawi on 30/05/1444 AH.
//

import SwiftUI

struct Home: View {
    
    // HIDDING TAB BAR
    init(name: Binding<String>, email: Binding<String>){
        UITabBar.appearance().isHidden = true
        self._name = name
        self._email = email
    }
    
    @StateObject var menuData = MenuViewModel()
    
    @Namespace var animation
    @Binding var name: String
    @Binding var email: String
    var body: some View {
        NavigationView{
            HStack(spacing: 0){
                // DRAWER AND MAIN VIEW
                
                //DRAWER....
                Drawer(animation: animation, name: $name)
                
                //MAIN VIEW...
                TabView(selection: $menuData.selectedMenu){
                    Profile(name: $name, email: $email)
                        .tag("Profile")
                    HomePage()
                        .tag("Home Page")
                    Favorites()
                        .tag("Favorites")
                    Your_Order()
                        .tag("Your Order")
                }.frame(width: UIScreen.main.bounds.width)
            }
            //MAX FRAMe
            .frame(width: UIScreen.main.bounds.width)
            //moving view
            .offset(x: menuData.showDrawer ? 125 : -125)
            .overlay(
                
                ZStack{
                    HStack{
                        if !menuData.showDrawer{
                            DrawerCloseButton(animation: animation)
                                .padding(.top, 10)
                                .padding(.leading, 310)
                           
                        }
                        
                    }
                    
                },alignment: .topLeading
                
            )
            .environmentObject(menuData)
        }
    }
}

struct Home_Previews: PreviewProvider {
    @State static var name: String = ""
    @State static var email: String = ""
    static var previews: some View {
        Home(name: $name, email: $email)
    }
}
