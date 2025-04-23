# github-users
This app list GitHub users, their details and public and not forked repositories.

Clicking in a repository will open this repository in a webview.

# Architecture and Dependencies
The app was built using MVVM with Coordinator. 

It has packages that were built thinking in reusability, such as `DesignSystem` and `NetworkKit`.

All features are protocol based and injected, making them easier to mock and test.

The main app is structured like:
> GitHubUser (Main Module)
 >> Dependencies (folder resolving dependency injection)

 >> Extension (extensions of types for the main module)

 >> Features (**folder where the actual screens are located**)

 >> Shared (common features and helpers that are used in the whole app)



# Token Configuration

GitHub has a rate limit of 60 requests if no tokens are used, so a personal api token was used. 

If you decide to not configure your personal token, the app will handle the requests without a token. 
This verification is done in a extension in the file `Extensions+EndpointData`.

# Setting you personal token

The app is already set to search for a personal token in a `.xcconfig` file. 

This files are ignored by default to avoid tokens getting leaked.

If you want to use you personal token:
1. Create a file named `Debug.xcconfig`
2. Paste your token like this: `GITHUB_API_TOKEN = {your_token_here}`
3. Configuration is already set, but ensure you configuration settings for the project are tracking the configuration file. Example below:


![Screenshot 2025-04-23 at 0 26 37](https://github.com/user-attachments/assets/c3d58657-f8be-445b-9f8c-72e2b468b38b)

4. Now the application will start returning a value for `GITHUB_API_TOKEN` and the requests will have a bearer token
