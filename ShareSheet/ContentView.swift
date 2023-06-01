//
//  ContentView.swift
//  ShareSheet
//
//  Created by Luis Umaña on 1/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var sheet = false
    
    var body: some View {
        
        let msg : String? = "This is a text to share"
        let image = UIImage(named: "pic")
        let url: String? = "https://agoodmovietowatch.com/"
        
        var objectsToShare : [Any] = []
        
        VStack{
            Text("Select what you want to share")
                .font(.title)
            
            Button(action: {
                objectsToShare.removeAll()
                objectsToShare = [msg as AnyObject]
                sheet.toggle()
                
            }, label: { Text(msg!)
                    .fontWeight(.heavy)
            })
            .padding()
            
            Button(action: {
                objectsToShare.removeAll()
                objectsToShare = [url as AnyObject]
                sheet.toggle()
                
            }, label: { Text(url!)
                    .fontWeight(.heavy)
            })
            .padding()
            
            Button {
                objectsToShare.removeAll()
                objectsToShare = [image as AnyObject]
                sheet.toggle()
            } label: {
                Label("Share image", systemImage: "camera")
            }
            .padding()
        }
        .sheet(isPresented: $sheet, content: {
            ShareSheet(objectsToShare: objectsToShare)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ShareSheet : UIViewControllerRepresentable{
    
    // the data you need to share
    var objectsToShare : [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let controller = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
}
