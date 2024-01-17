Rubric for Module 13
--------------------

The app must have a README file including: 

a) A basic explanation of the app: The app is nearly complete und is working, so I hope, that no explanation is necessary.

b) Explanations of how your app will fulfill the final submission rubric requirements (see next section).
    
c) A list of planned screens and elements: There are already complete.

d) The app has a splash screen suitable for the app. It can be either a static or animated splash screen: Is in place, I show a text message with animation built in.




Rubric for week 14
------------------

Now I discuss the points of the required Final Capstone App Functionality needed to pass in week 14:

a) We suggest using Xcode 14.3 or 14.3.1 and iOS 16.x, rather than Xcode 15 and iOS 17.

Here I use Xcode 15 and iOS 17, since Xcode 15 is installed on my mac mini. I do not even know, if I could use Xcode 14 in an easy way.

b) The app has a README file including: A basic explanation of the app, as well as explanations of how your app fulfills each of the rubric items. Identify your features and any specific file names so that your mentor doesn’t have to search for them while grading.

I can write some sentences more, but I hope all in all the code with its filenames is quite understandable.

c) The app has a splash screen suitable for the app. It can be either a static or animated splash screen.

This is already realized.

d) All features in the app should be completed. Any unfinished feature should be commented out.

Most features are already complete.

e) The app has at least one screen with a list using a view of your choice (List, grid, ScrollView .. etc). 

There are Grid and ScrollView in the App.

f) Each item in the list should contain (as a minimum) a name, a sub-title/description, and an image of the item - the text should be styled appropriately. 
Pressing on items in this list should lead to detail pages - this should show the same data in the list with some further details such as a longer description, bigger picture, price, and a Buy/Order button.
Include enough items to ensure that the user has to scroll the list to see all the items in it.
This should appear in a tab view with at least two tabs.

Most of that is realized. Lacking: sub-title/description in list items

g) The app has one or more network call(s) to download/upload data that relates to the core tasks of the app. Using strictly Apple’s URLSession.

That is realized.

h)     The app handles all typical errors related to network calls. Including at least: No network connection, server error.

That is realized.

i) The app uses at least one way to save data: userdefaults, keychain, or local database. Please list your method in the Readme.

That has yet to be done.

j) The app communicates to the user whenever data is missing or empty, the reason for that condition, and a step to take in order to move forward. In other words, no blank screens. The user should never “feel” lost.  For example, whenever there are no items, such as when the data cannot be loaded, explain it).

I hope that that is sufficiently realized.

k)     All included screens work successfully without crashes or UI issues. App works for both landscape and portrait orientations. App works for both light and dark modes. No obvious UI issues.

Realized

l) The code should be organized and easily readable. Project source files are organized in folders such as Views, Models, Networking etc. View components are abstracted into separate Views and source files. The model includes at least one ObservableObject with at least one Published value that at least one view subscribes to. The project utilizes SwiftLint with Kodeco’s configuration file. Follow instructions in the Kodeco Swift style guide. Project builds without Warnings or Errors. (TODO warnings should be moved to a different branch.)

Lacking: Lint

m) The code has both UI and unit testing with a minimum of 50% code coverage. All test cases pass.

Completely lacking

n)     The app includes: A custom app icon. An onboarding screen. A custom display name. At least one SwifUI animation. Styled text properties. SwiftUI modifiers are sufficient.

Lacking: Custom app icon, custom display name



 Still lacking
 -------------

 - Saving and loading of memos 
 - unit and UI tests, 50% coverage, all tests pass
 - sub-title/description in list items
 - lint
 - Custom app icon
 - Custom display name

 As particularly problematic I see the testing requirements. The video course on testing (with UI tests using UIKit, not SwiftUI) is not even called required, but only optional, and it is only quite short. So we are not well prepared here. I will see, what I can do, but at the moment I'm feeling rather exhausted.

 Most other points seem doable in a short time frame to me (save/load, subtitle, app icon, display name). With lint I have no clue how much work that will be.