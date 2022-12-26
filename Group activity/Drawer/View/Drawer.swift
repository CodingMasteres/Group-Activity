//
//  Drawer.swift
//  Drawer
//
//  Created by bayan batawi on 30/05/1444 AH.
//

import SwiftUI

struct Drawer: View {
    @EnvironmentObject var menuData: MenuViewModel
    var animation: Namespace.ID
    @Binding var name: String
    var body: some View {
        VStack{

            HStack{
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 85, height: 85)
                    .clipShape(Circle())
                Spacer()
                
                //CLOSE BUTTON
                if menuData.showDrawer{
                    DrawerCloseButton(animation: animation)
                }
               
            }
            .padding()
            
            VStack(alignment: .leading,spacing: 10, content:{
                
                Text("Hello")
                    .font(.title2)
                
                Text(self.name)
                    .font(.title)
                    .fontWeight(.heavy)
            })
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 5)
            
            //MENU BUTTONS
            VStack(spacing: 22){
                MenuButton(name: "Profile", image: "person.fill", selectedMenu: $menuData.selectedMenu, animation: animation)
                
                MenuButton(name: "Home Page", image: "house.fill", selectedMenu: $menuData.selectedMenu, animation: animation)
                
                MenuButton(name: "Favorites", image: "suit.heart.fill", selectedMenu: $menuData.selectedMenu, animation: animation)
                
                MenuButton(name: "Your Order", image: "bag.fill", selectedMenu: $menuData.selectedMenu, animation: animation)
                   
            }
            .padding(.leading)
            .frame(width: 250, alignment: .leading)
            .padding(.top, 30)
            
            Divider()
                .background(Color.white)
                .padding(.top, 30)
                .padding(.horizontal, 25)
            
            Spacer()
            Button(action: {}) {
                NavigationLink {
                   SignInAndSignUp()
                        .navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack{
                        Image(systemName: "rectangle.righthalf.inset.fill.arrow.right")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.red)
                            .padding(.trailing)
                        
                        Text("Sign Out").tint(.red)
                    }
                }

                        }
            
        }
        //DEFULT SIZE
        .frame(width: 250)
        .background(Color(.darkGray))

        
    }
}
struct Drawer_Previews: PreviewProvider {
    @State static var name: String = ""
    @State static var email: String = ""
    static var previews: some View {
        Home(name: $name, email: $email)
    }
}

//CLOSE BUTTON...
struct DrawerCloseButton: View{
    
    @EnvironmentObject var menuData: MenuViewModel
    var animation: Namespace.ID
    
    var body: some View{
        Button(action: {
            withAnimation(.easeInOut){
                menuData.showDrawer.toggle()
            }
        }, label: {
            
            VStack(spacing: 5){
                Capsule()
                    .fill(menuData.showDrawer ? Color.white : Color.primary)
                    .frame(width: 35, height: 3)
                    .rotationEffect(.init(degrees: menuData.showDrawer ? -50 : 0))
                    .offset(x: menuData.showDrawer ? 2 : 0 , y: menuData.showDrawer ? 9 : 0)
                VStack(spacing: 5){
                    Capsule()
                        .fill(menuData.showDrawer ? Color.white : Color.primary)                        .frame(width: 35, height: 3)
                    
                    Capsule()
                        .fill(menuData.showDrawer ? Color.white : Color.primary)                        .frame(width: 35, height: 3)
                        .offset(y: menuData.showDrawer ? -8 : 0)
                }
                .rotationEffect(.init(degrees: menuData.showDrawer ? 50 : 0))
                
            }
            
        })
        .scaleEffect(0.8)
        .matchedGeometryEffect(id: "MENU_BUTTON", in: animation)
    }
}
