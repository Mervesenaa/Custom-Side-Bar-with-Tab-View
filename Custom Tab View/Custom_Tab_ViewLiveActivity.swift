//
//  Custom_Tab_ViewLiveActivity.swift
//  Custom Tab View
//
//  Created by Merve Sena on 9.10.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Custom_Tab_ViewAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Custom_Tab_ViewLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Custom_Tab_ViewAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Custom_Tab_ViewAttributes {
    fileprivate static var preview: Custom_Tab_ViewAttributes {
        Custom_Tab_ViewAttributes(name: "World")
    }
}

extension Custom_Tab_ViewAttributes.ContentState {
    fileprivate static var smiley: Custom_Tab_ViewAttributes.ContentState {
        Custom_Tab_ViewAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Custom_Tab_ViewAttributes.ContentState {
         Custom_Tab_ViewAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Custom_Tab_ViewAttributes.preview) {
   Custom_Tab_ViewLiveActivity()
} contentStates: {
    Custom_Tab_ViewAttributes.ContentState.smiley
    Custom_Tab_ViewAttributes.ContentState.starEyes
}
