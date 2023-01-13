//
//  Gen3WidgetBundle.swift
//  Gen3Widget
//
//  Created by Elisei Bobocea on 13/01/2023.
//

import WidgetKit
import SwiftUI

@main
struct Gen3WidgetBundle: WidgetBundle {
    var body: some Widget {
        Gen3Widget()
        Gen3WidgetLiveActivity()
    }
}
