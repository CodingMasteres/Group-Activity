//
//  Profile.swift
//  Drawer
//
//  Created by 라완 💕 on 29/05/1444 AH.
//

import SwiftUI

struct Profile: View {
    @Binding var name: String
    @Binding var email: String
    var body: some View {
        ZStack(alignment: .top) {
            VStack{
                Rectangle()
                    .foregroundColor(Color("LightPink"))
                    .cornerRadius(25)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 150)
                
                Spacer()
            }
            VStack(spacing: 5){
                Text(self.name)
                    .bold()
                    .font(.title)
                Text(self.email)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding(.top,250)
            Circle()
            
                .strokeBorder(.white, lineWidth: 4)
                .background(Circle().fill(Color(.white)))
            
                .frame(width: 150, height: 300)
            
                .shadow(radius: 10)
            Image("profile")
                .resizable()
                .clipShape(Circle())
            
                .padding(.top, 0)
                .frame(width: 140, height: 300)
            
                .foregroundColor(Color("LightPink"))
            
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 85, height: 85)
                
        }
    }
}

struct Profile_Previews: PreviewProvider {
    @State static var name: String = ""
    @State static var email: String = ""
    static var previews: some View {
        Profile(name: $name, email: $email)
    }
}
