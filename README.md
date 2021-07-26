# Ios-Tutorial
Just Use 


For FaceBook
Setup the project on Facebook Developer Account
get Plist data and save onto your project 

 FacebookSignInHelper.shared.facebookSignIn(with: self) { fbData in
            // fetch your all data from fbData
            for example fbData.name and so on 
        }
        
 ###################################################################       
For Apple
Just add Capability of Apple Signin 

 AppleLoginHelper.shared.AppleSignIn(with: self) { appleData in
            // fetch your all data from appleData
            for example appleData.name and so on  
        }
####################################################################        
For Google 
Setup Account On Firebase For Login GEt Client Add and reverse Client Id 

put ClientId In Google Signin Helper File and reverse Client Id in Plist File According to Firebase Doc
 GoogleSignInHelper.shared.googleSignIn(with: self) { gdata in
            // fetch your all data from gdata
            for example gdata.name and so on    
        }
        
        
If You Are Unable to know where to put plist Data and all in Google and facebool just open .plist File as Source Code put the code Below and replace the data Where ever is Required denoted as #####

<key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLName</key>
            <string></string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>#####</string>
            </array>
        </dict>
    </array>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>FacebookAppID</key>
    <string>#####</string>
    <key>FacebookDisplayName</key>
    <string>#####</string>
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>fbapi</string>
         <string>fbapi20130214</string>
         <string>fbapi20130410</string>
         <string>fbapi20130702</string>
         <string>fbapi20131010</string>
         <string>fbapi20131219</string>
         <string>fbapi20140410</string>
         <string>fbapi20140116</string>
         <string>fbapi20150313</string>
         <string>fbapi20150629</string>
         <string>fbapi20160328</string>
         <string>fbauth</string>
         <string>fb-messenger-share-api</string>
         <string>fbauth2</string>
         <string>fbshareextension</string>
    </array>     
