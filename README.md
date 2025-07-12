# 10-MindPrep-FE

파일 구조
MindPrep/
├── App/
├── Models/
│   ├── User.swift
│   ├── Report.swift
│   ├── EmotionLetter.swift
│   ├── LoginCredentials.swift
│   └── KakaoUser.swift
├── Views/
│   ├── Login/
│   │   └── LoginView.swift
│   │   
│   ├── Home/
│   │   └── HomeView.swift         
│   │   
│   ├── Report/
│   │   └── ReportView.swift
│   │   
│   ├── EmotionLetter/
│   │   └── EmotionLetterView.swift
│   │   
│   └── Profile/
│       └── ProfileView.swift
│      
├── Component/
│   └── NavigationBar/
│
├── ViewModels/
│   ├── LoginViewModel.swift
│   ├── HomeViewModel.swift
│   ├── ReportViewModel.swift
│   ├── EmotionLetterViewModel.swift
│   └── ProfileViewModel.swift
├── Network/
│   ├── API/
│   │   ├── AuthAPI.swift
│   │   ├── ReportAPI.swift
│   │   ├── EmotionLetterAPI.swift
│   │   └── UserAPI.swift
│   ├── Services/
│   │   ├── AuthService.swift
│   │   ├── KakaoAuthService.swift
│   │   ├── ReportService.swift
│   │   ├── EmotionLetterService.swift
│   │   └── UserService.swift
│   └── NetworkManager.swift
├── Utilities/
│   └── Extensions/                
│   
│  
├── Resources/
│   ├── Fonts/                     
│   └── Assets.xcassets            
└── Info.plist                    
