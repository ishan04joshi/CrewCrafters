//
//  HackLandViewModel.swift
//  CrewCrafters
//
//  Created by Manvi Singhal on 15/12/23.
//

import Foundation

class HackLandViewModel: ObservableObject {
    @Published var themeItems: [HackLandThemeListItem] = [
        HackLandThemeListItem(title: "Artificial Intelligence"),
        HackLandThemeListItem(title: "Natural Language Processing"),
        HackLandThemeListItem(title: "App: Weather API"),
        HackLandThemeListItem(title: "Deep Learning: Augmented Reality (AR)"),
        HackLandThemeListItem(title: "Marketplace and Community Hub"),
    ]
    
    @Published var timelineItems: [HackLandTimelineListItem] = [
        HackLandTimelineListItem(title: "Registrations", desc:"November 02 - November 19 "),
        HackLandTimelineListItem(title: "Submissions", desc:"November 20 - November 25" ),
        HackLandTimelineListItem(title: "Round 1", desc:"November 27 - November 30"),
        HackLandTimelineListItem(title: "Round 2", desc:"December 4 - December 6"),
        HackLandTimelineListItem(title: "Final Round", desc:"December 9 - December 10"),
    ]
}
