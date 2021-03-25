//
//  PersonViewModel.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-02-04.
//

import Foundation

class PersonViewModel: ObservableObject {
    var textAboutSwedish = "Snittsvensken är ansvarig för elva ton koldioxidutsläpp per år, eller 30 kilo per dag, enligt Naturvårdsverkets beräkningar. Detta blir ca 900 kilo per månad. För att minska ditt fotavtryck och hålla dig inom ramen en jordglob måste du ha ett mål på mindre än 600 kilo CO2 per månad."
    @Published var val = 200.0
    @Published var isEditing = false
    @Published var isEditingText = false
    @Published var showingDetail = false
    @Published var showingFriends = false
    @Published var username = "Viktor Vestlund"
    
}
