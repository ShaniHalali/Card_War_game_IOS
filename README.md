# Card War Game – iOS App

Welcome to **Card War**, an iOS application developed using Swift and UIKit, where players engage in a fast-paced battle of cards. The game includes custom graphics, a scoring system, and a user-friendly experience built with the MVC design pattern.
- Watch it now !
  [Full Game Record](https://www.youtube.com/watch?v=rat8DN_isas)

  <img src="https://github.com/user-attachments/assets/82155cc9-41e7-4491-b439-a3dc079e44fa" alt="Permissions" width="20%" height="20%">

## 📱 Features

- 🎮 Classic *War* style card gameplay: player vs computer
- 🕹️ Timer-based turns for a dynamic experience
- 🌍 Location based customization: east or west side
- 🔊 Sound effects for flipping cards, winning rounds, and background music
- 🏆 Final score screen showing the winner

## 🧱 Architecture

The app follows **MVC (Model-View-Controller)** design:

- **Model:** Handles the location and sounds managers
- **View:** Created using Storyboards and Interface Builder
- **Controller:** Manages user interaction and updates the view

## 🗂️ Screens

1. **Welcome Screen:**  
   - Users input their name once, and it’s stored using UserDefaults.
   - Request location permission to detect your hemisphere
   - Detect your hemisphere and set East/West image accordingly  

2. **Game Screen:**  
   - Flip cards automatically every few seconds  
   - Timer and round indicators  
   - Pause and resume button  

3. **Result Screen:**  
   - Displays final scores and winner  

## 💾 UserDefaults

- The app saves the player's name using UserDefaults so it is retained across launches.

## 🔊 Sound Manager

- A custom SoundManager.swift class manages background music and sound effects with AVFoundation.
- Music plays in a loop and volume can be adjusted.

## 📍 Location Manager
When entering the app, your location is sampled.
If your longitude is east of 34.8175491683243340, you're assigned the East side. Otherwise, you're on the West.
This decision affects which side you're displayed on in the game.
  
## 🔐 Permissions

The app requests access to the user's **location** using Core Location, solely for the purpose of determining whether the user is located in the northern or southern hemisphere. This information is used to personalize the UI by setting the player to the East or West side accordingly.

📌 No location data is stored, tracked, or shared with third parties.

<img src="https://github.com/user-attachments/assets/40ccde9b-d5aa-45d5-a225-6aea78e61308" alt="Permissions" width="10%" height="10%">


## 🎆 Visual Effects
A confetti effect is triggered when the player wins.
Clean animations for card flip backs after each round.

## 🧪 Requirements

- iOS 14.0+
- Xcode 15+
- Swift 5+

# Screen Shots
## Horizontally – Light Mode
<img src="https://github.com/user-attachments/assets/35cb60db-3a2a-43dd-96a7-15159ce1a0bf" alt="WelcomeController" width="30%" height="30%">
<img src="https://github.com/user-attachments/assets/0ac57ed5-84ee-44e6-a232-321a13ab48d5" alt="GameController" width="30%" height="30%">
<img src="https://github.com/user-attachments/assets/2353e0f4-5b0e-4438-bc74-baef3774105f" alt="ResultController" width="30%" height="30%">

## Horizontally – Dark Mode
<img src="https://github.com/user-attachments/assets/40a304ec-3e57-402f-8006-24b02cef14ce" alt="WelcomeController" width="30%" height="30%">
<img src="https://github.com/user-attachments/assets/c0080584-61e6-4d6f-94f0-6c33fb00aa2c" alt="GameController" width="30%" height="30%">
<img src="https://github.com/user-attachments/assets/7bfa419d-26e0-4094-8218-5dd354fee6b9" alt="ResultController" width="32%" height="35%">

## Vertically – Light Mode
<img src="https://github.com/user-attachments/assets/0a7d1586-8025-4f43-96f7-96e9fef5f702" alt="WelcomeController" width="25%" height="15%">
<img src="https://github.com/user-attachments/assets/0ce4a00f-f9e5-4fec-b365-ac86f3b76de0" alt="GameController" width="27%" height="30%">
<img src="https://github.com/user-attachments/assets/99bee75c-8afb-4c70-918e-d2b8192b889f" alt="ResultController" width="26.5%" height="30%">


