//
//  ContentView.swift
//  ilkswift
//
//  Created by akdeniz bilgisayar on 4.11.2022.
//

import SwiftUI
 

struct ContentView: View {
    @State private var userName = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username",text:$userName)
                        .padding()
                        .frame(width:300,height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongUsername))
                    SecureField("Password",text:$password)
                        .padding()
                        .frame(width:300,height: 50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                    Button("Login"){
                        authheticateUser(username: userName, password: password)
                    }
                        .foregroundColor(.white)
                        .frame(width:300,height:50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                    /*NavigationLink(destination: Text("You are logged in @\(userName)"),isActive:$showingLoginScreen){
                        EmptyView()
                    }*/
                    NavigationLink(
                        destination:vericek2(),
                        label: {
                            VStack{
                            Text("Fetch Data")
                                    .foregroundColor(Color.black)
                            }
                        }
                    )
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    func authheticateUser(username:String,password:String){
        if username.lowercased() == "user" {
            wrongUsername = 0
            if password.lowercased() == "1234" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        }else{
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
