//
//  MenuModel.swift
//  Drawer
//
//  Created by bayan batawi on 30/05/1444 AH.
//

import SwiftUI

//MENU DATA...
class MenuViewModel: ObservableObject{
    //defult value
    @Published var selectedMenu = "Home Page"
    
    //show...
    @Published var showDrawer = false
}
