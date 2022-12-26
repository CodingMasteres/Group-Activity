//
//  SignInAndSignUp.swift
//  ordering
//
//  Created by Shahad on 12/24/22.
//

import SwiftUI

struct SignInAndSignUp: View {
    var body: some View {
        
     Homee()
            .preferredColorScheme(.light)
       
    }
}



struct Homee: View {
    
    @State var index = 0
    @State static var name: String = ""
    @State static var email: String = ""
    var body: some View {
        NavigationView{
            GeometryReader{_ in
                
                VStack {
                    // the logo image
                    Text("Welcome To CM Store")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(80)
                    
                    
                    // .padding(.top, 100)
                    
                    ZStack {
                        
                        SignUp(index: self.$index)
                        // changing view order
                            .zIndex(Double(self.index))
                        SignIn(name: Homee.name, email: Homee.email, index: $index)
                        //SignIn(index: self.$index, naame: self.$naame)
                        
                    }
                    
                }
            }
           
            
            // .background(Color("DarkPink")).edgesIgnoringSafeArea(.all)
            .background(
                Image("BackGround")
                    .resizable()
                    .ignoresSafeArea()
            )
        }
    }
}

//Curve

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            // rigth side curve
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            // left side curve
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}


// Sign in page
struct SignIn: View {
    @State var name = ""
    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    var body: some View {
        
        
            ZStack {
                //  Color("DarkPink")
                VStack {
                    HStack {
                        VStack(spacing: 56) {
                            // the sign in title
                            Text("Sign in")
                                .foregroundColor(Color(self.index == 0 ? "Black" : "White"))
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Capsule()
                                .fill(self.index == 0 ? Color.white : Color.clear)
                                .frame(width: 100, height: 5)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    
                    .padding(.top, 20)
                    
                    VStack {
                        // the name field
                        HStack(spacing: 15) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("Black"))
                            TextField("Full Name", text: self.$name)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack {
                        // the email field
                        HStack(spacing: 15) {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("Black"))
                            TextField("Email Address", text: self.$email)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack {
                        // the password field
                        HStack(spacing: 15) {
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(Color("Black"))
                            SecureField("Password", text: self.$pass)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    HStack {
                        
                        Spacer(minLength: 0)
                        
                        // the forgot password button
                        Button(action: {
                            
                        }) {
                            Text("Forgot Password?")
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    }
                    
                    .padding(.horizontal)
                    .padding(.top, 7)
                    
                }
                .padding()
                // bottom padding
                .padding(.bottom, 65)
                .background(Color("LightPink"))
                .clipShape(CShape())
                .contentShape(CShape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
                
                //Sign in Button
                
                VStack {
                    Button(action: {}) {
                        NavigationLink {
                            Home(name: $name, email: $email)
                                .navigationBarBackButtonHidden(true)
                            
                        } label: {
                            Text("SIGN IN")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .padding(.horizontal, 50)
                                .background(Color("DarkPink"))
                                .clipShape(Capsule())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            // shadow
                                .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                        }
                    }
                    // movig the sign in button down
                    .offset(y: 240)
                    .opacity(self.index == 0 ? 1 : 0)
                        
                }

            }
        }
    }


// Sign up page
struct SignUp: View {
    @State var name = ""
    @State var email = ""
    @State var pass = ""
    @State var Repass = ""
    @Binding var index: Int
    var body: some View {
        
       
            ZStack {
                VStack {
                    HStack {
                        Spacer(minLength: 0)
                        
                        VStack(spacing: 10) {
                            
                            // the sign in title
                            Text("Sign Up")
                                .foregroundColor(Color(self.index == 1 ? "Black" : "White"))
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Capsule()
                                .fill(self.index == 1 ? Color.white : Color.clear)
                                .frame(width: 100, height: 5)
                        }
                    }
                    
                    .padding(.top, 20) // for top curve
                    
                    VStack {
                        // the name field
                        HStack(spacing: 15) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("Black"))
                            TextField("Full Name", text: self.$name)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack {
                        // the email field
                        HStack(spacing: 15) {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("Black"))
                            TextField("Email Address", text: self.$email)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack {
                        // the password field
                        HStack(spacing: 15) {
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(Color("Black"))
                            SecureField("Password", text: self.$pass)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    // Replacing forgot password with Re enter password
                    
                    VStack {
                        // the re enter password field
                        HStack(spacing: 15) {
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(Color("Black"))
                            SecureField("Conferm Password", text: self.$Repass)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    HStack {
                        
                        Spacer(minLength: 0)
                    }
                    
                    .padding(.horizontal)
                    .padding(.top, 7)
                    
                }
                .padding()
                // bottom padding
                .padding(.bottom, 65)
                .background(Color("LightPink"))
                .clipShape(CShape1())
                // cliping the content shape
                .contentShape(CShape1())
                // shadow
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 1
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
                
                VStack {
                    Button(action: {}) {
                        NavigationLink {
                            Home(name: $name, email: $email)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("SIGN UP")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .padding(.horizontal, 50)
                                .background(Color("DarkPink"))
                                .clipShape(Capsule())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            // shadow
                                .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                            //                         movig the sign in button down
                            
                        }
                    }
                    
                    .offset(y: 240)
                    
                    // hiding view when it's in background
                    .opacity(self.index == 1 ? 1 : 0)
                }
            }
        }
    }



struct SignInAndSignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignInAndSignUp()
    }
}
