//
//  Settings.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack{
            List{
                Section(header: Text("Account")
                    .font(.subheadline)
                    .fontWeight(.bold)){
                        HStack{
                            Image(systemName: "person.crop.circle")
                                .padding(.trailing, 20.0)
                            Text("Edit profile")
                        }
                        HStack{
                            Image(systemName: "shield.lefthalf.filled").padding(.trailing, 20.0)
                            Text("Security")
                        }
                        HStack{
                            Image(systemName: "bell.badge.fill").padding(.trailing, 20.0)
                            Text("Notification")
                        }
                        HStack{
                            Image(systemName: "lock.fill").padding(.trailing, 20.0)
                            Text("Privacy")
                        }
                    }
                
                Section(header: Text("Support & About")
                    .font(.subheadline)
                    .fontWeight(.bold)){
                        HStack{
                            Image(systemName: "creditcard.fill")
                                .padding(.trailing, 20.0)
                            Text("Subscription")
                        }
                        HStack{
                            Image(systemName: "person.fill.questionmark").padding(.trailing, 20.0)
                            Text("Help & Support")
                        }
                        HStack{
                            Image(systemName: "list.bullet.clipboard.fill").padding(.trailing, 20.0)
                            Text("Terms & Policies")
                        }
                        
                    }
                
                Section(header: Text("Cache & Cellular")
                    .font(.subheadline)
                    .fontWeight(.bold)){
                        HStack{
                            Image(systemName: "trash.fill")
                                .padding(.trailing, 20.0)
                            Text("Free up Space")
                        }
                        HStack{
                            Image(systemName: "chart.line.downtrend.xyaxis").padding(.trailing, 20.0)
                            Text("Data Saver")
                        }
                        
                        
                    }
                
                Section(header: Text("Actions")
                    .font(.subheadline)
                    .fontWeight(.bold)){
                        HStack{
                            Image(systemName: "flag.badge.ellipsis")
                                .padding(.trailing, 20.0)
                            Text("Report a problem")
                        }
                        HStack{
                            Image(systemName: "person.2.circle").padding(.trailing, 20.0)
                            Text("Add Account")
                        }
                        HStack{
                            Image(systemName: "rectangle.portrait.and.arrow.right").padding(.trailing, 20.0)
                            Text("Log Out")
                        }
                    }
            }
        }.navigationTitle("Settings")
            .padding(.all, 7)
    }
}


#Preview {
    Settings()
}
