//
//  PhoneList.swift
//  SimpleSwiftUItableView
//
//  Created by Nirja Pathak on 03/04/21.
//  Copyright © 2021 Nirja Pathak. All rights reserved.
//

import SwiftUI

struct contentView: View {
    @State private var editMode = EditMode.inactive
    var PhoneAddContact: [Calls]
    var body: some View {
        NavigationView {
                   
            VStack{
            List
                   {
                    
                    ForEach(PhoneAddContact){
                       
                         Calls in
                        NavigationLink(destination :Text(Calls.name))
                         {                        RowList(eachCalls: Calls)
                        
                    }
                        }
            
                    .onDelete(perform: onDelete)
                    .onMove (perform : onMove)
                   
            }
                .navigationBarTitle("Contact List")
             .navigationBarItems(leading: EditButton())
              .environment(\.editMode, $editMode)
            
            

           
        }
        }
       
    }
}

 func onDelete(at offsets: IndexSet)
{
    myContact.remove(atOffsets: offsets)
    
}

 func onMove(source:IndexSet, destination:Int)
{
    myContact.move(fromOffsets: source, toOffset: destination)
    
}


struct RowList: View
{
    var eachCalls: Calls
  var body: some View{
               HStack{
                    Text(eachCalls.name)
                  .font(.callout)
                .foregroundColor(Color.orange)
                .padding(.all)
                    Spacer()
                    Text(eachCalls.number)
                                       .font(.caption)
                                       .padding(.all)
                               }
                               
                           }
                       }

var myContact = [
    Calls( id:1,name:"Nirja",number:"(789) 789-7896"),
    Calls( id:2,name:"John",number:"(555) 123-0983"),
    Calls( id:3,name:"Tom",number:"(441) 369-7123"),
    Calls(id:4,name: "Sem",number:"(562) 222-7894"),
    Calls(id:5,name:"Neena",number:"(889) 756-2136")]

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        contentView(PhoneAddContact:myContact)
    }
}
