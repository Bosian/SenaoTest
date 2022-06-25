//
//  ListPreview.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/24.
//

import SwiftUI

struct ListPreview: UIViewRepresentable {
    
    let viewController: UINavigationController
    
    init() {
        let storyboard = UIStoryboard(name: "ListStoryboard", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        self.viewController = navigationController
    }
    
    func makeUIView(context: Context) -> UIView {
        return viewController.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

struct List_Preview: PreviewProvider {

    static var previews: some View {
        Group {
            ListPreview()
                .ignoresSafeArea(edges: .all)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            
            ListPreview()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}
