# Mailbox

This is an iOS demo application for the message triaging functions of the Mailbox app.

Time spent: 18 hours spent in total + 3 hours spent on doing part of the lab at home

Completed user stories:

On dragging the message left...
 * [x] Initially, the revealed background color should be gray.
 * [x] As the reschedule icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
 * [x] After 60 pts, the later icon should start moving with the translation and the background should change to yellow.
 * [x] Upon release, the message should continue to reveal the yellow background. When the animation it complete, it should show the reschedule options.
 * [x] After 260 pts, the icon should change to the list icon and the background color should change to brown.
 * [x] Upon release, the message should continue to reveal the brown background. When the animation it complete, it should show the list options.
 * [x] User can tap to dismissing the reschedule or list options. After the reschedule or list options are dismissed, you should see the message finish the hide animation.
On dragging the message right...
 * [x] Initially, the revealed background color should be gray.
 * [x] As the archive icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
 * [x] After 60 pts, the archive icon should start moving with the translation and the background should change to green.
 * [x] Upon release, the message should continue to reveal the green background. When the animation it complete, it should hide the message.
 * [x] After 260 pts, the icon should change to the delete icon and the background color should change to red.
 * [x] Upon release, the message should continue to reveal the red background. When the animation it complete, it should hide the message.
 * [x] Optional: Panning from the edge should reveal the menu
 * [x] Optional: If the menu is being revealed when the user lifts their finger, it should continue revealing.
 * [x] Optional: If the menu is being hidden when the user lifts their finger, it should continue hiding.
 * [x] Optional: Tapping on compose should animate to reveal the compose view.
 * [-] Optional: Tapping the segmented control in the title should swipe views in from the left or right.
 * [-] Optional: Shake to undo.

Notes:
This was definitely more of a struggle. Much more programming and code, but fun, as well. I found myself getting a bit lost at times, but struggling through the logic on the conditionals for the gesture recognizer flows was a good experience. At one point, I borked my repo, and Tim had to rescue my work and revert an old commit. Luckily, I didn't lose a ton of work ... the process also helped me debug one part of my interation, where I had made a quick change to positions of elements on my storyboard that made things disappear in the UI. I changed the size and placement of the scrollview which threw a bunch of things off. Once I figured out what I had done, it wasn't too bad to recover.

Walkthrough of all user stories:

![Video Walkthrough](mailbox.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).
