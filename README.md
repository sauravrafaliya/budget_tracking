
# Budget Tracking

Budget Tracking screen offers a clear overview, celebrates progress, and empowers users to take control of their finances.




## Third party packages Used

- syncfusion_flutter_gauges: ^24.1.41
- get: ^4.6.6
- firebase_core: ^2.24.2
- flutter_svg: ^2.0.9
- firebase_auth: ^4.15.3
- google_sign_in: ^6.2.1
- cloud_firestore: ^4.13.6
- connectivity_plus: ^5.0.2
- intl: ^0.18.1


## Firebase configurations


#### This app use google Authentication for Authenticate user and data security 

- Go to the Firebase Authentication section in your project console.
- Under "Sign-in method," locate the "Google" provider.
- Click the "Enable" button.

- From any directory, run this command:
```
dart pub global activate flutterfire_cli
```

- Then, at the root of your Flutter project directory, run this command:
```
flutterfire configure --project=<project-id>
```

- Add SHA-1 key in android app section

- iOS Setup
```
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<!-- TODO Replace this value: -->
			<!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
			<string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
		</array>
	</dict>
</array>
```






#### Firestore security rules that restrict access to authorized users

```sh
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /user/{userId} {
      allow read, write: if request.auth.uid == userId;  // Only allow access to the user's own data
    }
  }
}
```
## Run

To deploy this project run

```bash
  flutter pub get
```


```bash
  flutter run
```

