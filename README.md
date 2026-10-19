# 🎓 AI-Based Student Career Recommendation System
### College Design Thinking Project — Full-Stack Java Web Application

A complete, modern, responsive website and decision-support platform designed to help students discover the most suitable career pathways based on their technical skills, favourite subjects, personal interests, education level, and career aspirations.

---

## 🌟 Key Highlights & Design Thinking Features

- **100% Pure Java AI/ML Backend:** Recommendation engine implemented entirely in Java using **Vector Space Model (TF-IDF Cosine Similarity)**, **K-Nearest Neighbors (KNN)**, and an explainable **5-Factor Weighted Multi-Criteria Rule Scorer**. No Python, Flask, or external API dependencies required!
- **Transparent & Explainable Matching:** Shows exactly why each career is recommended with factor score breakdowns (Skills 40%, Subjects 25%, Interests 15%, Education 10%, Work Goals 10%).
- **Interactive Skill Gap Analyzer:** Compares current student competencies with industry career profiles, flags missing skills, and calculates a real-time **Readiness Score (%)**.
- **Dynamic Learning Roadmap:** Curated 3-phase curriculum (Foundations, Core Competencies, Advanced & Portfolio) with direct links to high-quality, free courses and official documentation.
- **Embedded Zero-Config Database:** Uses SQLite (`data/career_system.db`) with automatic table creation and pre-loaded demonstration data.
- **Modern Responsive UI/UX:** Styled using a palette of emerald green, light sky blue, soft cream, and crisp white with rounded controls, glassmorphic cards, and responsive layouts for phones, tablets, and laptops.
- **Role-Based Security:** Student registration/login, Faculty Admin portal, BCrypt password hashing, and session management.

---

## 🛠️ Technology Stack

| Layer | Technology | Details |
|---|---|---|
| **Frontend** | HTML5, CSS3, Vanilla ES6+ JavaScript | Modern component cards, responsive CSS Grid/Flexbox, tag inputs |
| **Backend** | Java Spring Boot (v2.7.18) | RESTful APIs, Session Management, Spring MVC, Spring Data JDBC |
| **Database** | SQLite 3 | Embedded database (`data/career_system.db`) via `sqlite-jdbc` |
| **AI / Machine Learning** | Pure Java (Smile ML & Custom Vector Space Engine) | TF-IDF Cosine Similarity, K-Nearest Neighbors Classifier, Rule Scorer |
| **Security** | BCrypt (`jbcrypt:0.4`) | Secure 10-round salted password hashing & HTTP Sessions |
| **Build Tool** | Apache Maven | Standard `pom.xml` configuration (compatible with Java 8, 11, 17, 21) |

---

## 📁 Project Directory Structure

```text
ai-career-recommender/
├── pom.xml                                   # Maven dependencies & build configuration
├── README.md                                 # Complete documentation & setup instructions
├── DESIGN_THINKING_REPORT.md                 # 5-Stage Design Thinking academic report
├── VIVA_PRESENTATION_GUIDE.md                # Presentation script & 25+ Viva Q&A
├── run.bat                                   # One-click Windows startup script
├── run.sh                                    # Linux / macOS startup script
├── data/
│   └── career_system.db                      # SQLite database (auto-generated on run)
├── src/
│   ├── main/
│   │   ├── java/com/college/career/
│   │   │   ├── CareerRecommenderApplication.java    # Spring Boot Main Class
│   │   │   ├── config/
│   │   │   │   ├── DatabaseConfig.java              # Auto-creates SQLite tables & directories
│   │   │   │   └── WebMvcConfig.java                # Static resource mappings
│   │   │   ├── model/
│   │   │   │   ├── User.java                        # User entity (Student / Admin)
│   │   │   │   ├── StudentProfile.java              # Academic and skills profile
│   │   │   │   ├── Career.java                      # Career pathway record
│   │   │   │   ├── CareerSkill.java                 # Core & recommended skills
│   │   │   │   ├── LearningResource.java            # Courses & documentation
│   │   │   │   ├── CareerMatch.java                 # Evaluated recommendation with scores
│   │   │   │   ├── RecommendationResponse.java      # Top 3 response DTO with disclaimer
│   │   │   │   ├── SkillGapResponse.java            # Gap analysis & 3-phase roadmap
│   │   │   │   └── SystemStats.java                 # Admin dashboard metrics
│   │   │   ├── repository/
│   │   │   │   ├── UserRepository.java              # SQLite user queries
│   │   │   │   ├── ProfileRepository.java           # Profile persistence
│   │   │   │   ├── CareerRepository.java            # Careers & bookmarks
│   │   │   │   └── RecommendationRepository.java    # Recommendation logs & stats
│   │   │   ├── service/
│   │   │   │   ├── UserService.java                 # Authentication & registration
│   │   │   │   ├── StudentProfileService.java       # Profile validation & updates
│   │   │   │   ├── CareerService.java               # Search, filter, CRUD
│   │   │   │   ├── SkillGapService.java             # Gap calculation & roadmap generator
│   │   │   │   └── ml/
│   │   │   │       ├── BenchmarkDataset.java        # 120 synthetic benchmark student profiles
│   │   │   │       ├── VectorSpaceModel.java        # TF-IDF & Cosine Similarity in Java
│   │   │   │       ├── KnnClassifier.java           # Java K-Nearest Neighbors Classifier
│   │   │   │       ├── RuleBasedScorer.java         # 5-factor transparent scoring engine
│   │   │   │       └── CareerRecommendationEngine.java # Hybrid ensemble orchestrator
│   │   │   ├── controller/
│   │   │   │   ├── AuthController.java              # /api/auth (login, register, session)
│   │   │   │   ├── ProfileController.java           # /api/profile (view, save, acquire skills)
│   │   │   │   ├── RecommendationController.java    # /api/recommendations/generate
│   │   │   │   ├── CareerController.java            # /api/careers (catalog, search, favourites)
│   │   │   │   ├── SkillGapController.java          # /api/skills/gap/{id}
│   │   │   │   └── AdminController.java             # /api/admin (stats, students, career CRUD)
│   │   │   └── util/
│   │   │       └── PasswordHasher.java              # BCrypt utility
│   │   └── resources/
│   │       ├── application.properties               # Server port 8080 & SQLite URL
│   │       ├── schema.sql                           # SQLite table DDL
│   │       ├── data.sql                             # Seed data (8 careers, 40+ skills, demo users)
│   │       └── static/                              # Frontend web files
│   │           ├── index.html                       # Complete 8-page responsive application
│   │           ├── css/
│   │           │   └── styles.css                   # Emerald green, blue & cream modern theme
│   │           └── js/
│   │               ├── app.js                       # SPA router & initialization
│   │               ├── auth.js                      # Login, modal, and session logic
│   │               ├── profile.js                   # Profile form, tag inputs & validation
│   │               ├── recommend.js                 # Top 3 recommendations & breakdown
│   │               ├── explorer.js                  # Search, filter & career details modal
│   │               ├── skillgap.js                  # Interactive skill checklist & roadmap
│   │               ├── dashboard.js                 # Student dashboard & bookmarked careers
│   │               └── admin.js                     # Admin analytics & career CRUD
│   └── test/java/com/college/career/
│       └── RecommendationEngineTest.java            # Unit tests for Vector Model, KNN, & Scorer
```

---

## 🚀 Step-by-Step Installation & Setup

### 1. Prerequisites: Java & Maven

This project runs on standard Java (JDK 8, 11, 17, or 21) and Apache Maven.

#### Installing Java on Windows:
1. Download OpenJDK from [Adoptium Eclipse Temurin](https://adoptium.net/) (JDK 17 or JDK 21 Recommended).
2. Run the installer and ensure you check the box: **"Set JAVA_HOME variable"** and **"Add to PATH"**.
3. Open a new Command Prompt / PowerShell and verify:
   ```cmd
   java -version
   ```

#### Installing Apache Maven on Windows:
1. Download `apache-maven-3.9.x-bin.zip` from [https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi).
2. Extract to `C:\Program Files\Apache\maven`.
3. Add `C:\Program Files\Apache\maven\bin` to your System `PATH` environment variable.
4. Verify in terminal:
   ```cmd
   mvn -version
   ```

---

### 2. Running in IntelliJ IDEA (Recommended & Easiest)

1. Open **IntelliJ IDEA**.
2. Click **File -> Open...** and select the `ai-career-recommender` folder.
3. IntelliJ will automatically detect the `pom.xml` and download dependencies.
4. In the Project Explorer, navigate to:
   `src/main/java/com/college/career/CareerRecommenderApplication.java`
5. Right-click `CareerRecommenderApplication.java` and click **Run 'CareerRecommenderApplication'**.
6. Open your browser and visit: **`http://localhost:8080`**.

---

### 3. Running in Visual Studio Code (VS Code)

1. Open **VS Code**.
2. Install the **Extension Pack for Java** and **Spring Boot Extension Pack** from Microsoft.
3. Click **File -> Open Folder...** and select `ai-career-recommender`.
4. Open a terminal (`Ctrl + ~`) inside VS Code and execute:
   ```cmd
   mvn spring-boot:run
   ```
5. Open your browser and visit: **`http://localhost:8080`**.

---

### 4. Running via One-Click Script

On Windows, double-click `run.bat`. The script automatically verifies Java, provides automatic portable Maven bootstrapping if needed, starts the Spring Boot service, and keeps the server active.

---

## 🔑 Demonstration Accounts

| Role | Email | Password | Access Capabilities |
|---|---|---|---|
| **Faculty Admin** | `admin@careerai.edu` | `Admin@123` | Full Admin Dashboard, Career CRUD, Student Records, System Stats |
| **Demo Student** | `alex.morgan@college.edu` | `Student@123` | Pre-filled assessment, recommendations, favourites, skill checklist |
| **New Student** | Self-registered | Chosen at signup | Full student assessment, recommendations, and dashboard |

> **Presentation Tip:** On the Login modal, click the **"⚡ Presentation One-Click Demo Access"** buttons (`👨‍🎓 Demo Student` or `🔑 Faculty Admin`) to instantly log in during your project viva!

---

## 🧪 Testing All Major Features

1. **Home Page & Navigation:**
   - Verify hero counters (8+ Careers, 40+ Skills, 100% Java).
   - Click "Get Career Recommendations" or "Explore Careers" to test smooth single-page routing.
2. **Student Profile Assessment:**
   - Click **"⚡ Fill Demo Student Data"** to auto-populate the assessment.
   - Click popular tags (`+ Java`, `+ Python`, `+ SQL`, `+ Data Structures`) to test tag insertion.
   - Click **"Analyze & Generate AI Recommendations"**.
3. **AI Recommendations Result:**
   - Inspect the Top 3 career cards with Gold, Silver, and Bronze rank badges.
   - Observe the compatibility percentage meter (e.g., 92.4%).
   - Examine the **5-Factor Breakdown** (Skills, Subjects, Interests).
   - Read the natural-language explanation showing exactly which skills and subjects matched.
4. **Career Explorer:**
   - Type `Python` or `Security` into the live search input.
   - Click domain filter pills (`Software`, `Web`, `Data Science`, `AI/ML`, `Cybersecurity`, `UI/UX`, `Cloud`).
   - Click **"Explore Details"** on any career to open the rich modal.
   - Click **"☆ Bookmark"** to add to student favourites.
5. **Skill Gap & Roadmap:**
   - Select any career from the dropdown.
   - Review your **Career Readiness (%)**.
   - Check the **"Interactive Skill Acquisition Checklist"**: tick an unlearned skill to see your readiness score immediately update and save to SQLite!
   - Explore the 3-phase roadmap with curated links.
6. **Student Dashboard:**
   - View your student profile summary, recent recommendations, and bookmarked careers.
7. **Faculty Admin Control Center:**
   - Log in as `admin@careerai.edu` / `Admin@123`.
   - Access the **Admin** tab.
   - Inspect registered student accounts and system KPIs.
   - Test adding a new career pathway or editing an existing one.

---

## ⚙️ How the Recommendation Algorithm Works (Simple Language)

1. **Feature Extraction:**
   When a student completes their profile, the text features (skills, subjects, interests, stream, and goals) are normalized and transformed into a high-dimensional TF-IDF vector.
2. **K-Nearest Neighbors (KNN) ML Classification:**
   The vector is matched against a benchmark corpus of 120 student archetype vectors across 8 careers. The top 7 nearest neighbors vote for the most aligned career pathways with distance weighting.
3. **5-Factor Multi-Criteria Rule Scorer:**
   The system calculates deterministic percentage matches across:
   - Technical Skills (40% weight): Core skills weighted higher (1.3x) than general skills.
   - Academic Subjects (25% weight): Intersection of student's favourite courses with career foundations.
   - Personal Interests (15% weight): Overlap with day-to-day responsibilities.
   - Education & Branch Fit (10% weight): Stream alignment.
   - Work Style & Goals (10% weight): Remote/Hybrid and career keywords.
4. **Ensemble Final Score:**
   The hybrid engine blends the ML similarity score (40%) with the Rule-based score (60%) to generate calibrated compatibility percentages (0-100%) and natural-language rationales.

---

## 🛠️ Troubleshooting Common Errors

- **Port 8080 already in use:**
  If another application is using port 8080, open `src/main/resources/application.properties` and change:
  ```properties
  server.port=8081
  ```
  Then visit `http://localhost:8081`.
- **`java` or `mvn` command not found:**
  Ensure JDK is installed and the `bin` directory is added to your Windows environment `PATH`.
- **Database file locked or reset needed:**
  SQLite stores data in `data/career_system.db`. If you wish to reset all demonstration data to factory defaults, simply stop the server, delete the `data/` folder, and restart the application.

---

## 📜 Academic Integrity & Design Thinking Notice
This system was built as an academic design thinking project. Recommendations are algorithmic decision-support aids based on profile cosine vector similarity. They do not guarantee job offers or hiring outcomes. Final career choices should always be paired with faculty mentoring and hands-on portfolio projects.
