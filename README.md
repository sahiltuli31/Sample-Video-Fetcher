# Prime Metadata Fetcher

An iOS SwiftUI app that retrieves video metadata from Amazon Prime Video’s internal API.  
The app uses a reverse-engineered production API, without public API keys.

## Features
- Search by video ID or title  
- Debouncer to avoid redundant API calls  
- Fetches and displays metadata (title, description, season/series info, release date, images)  
- Uses SwiftUI and async/await  


## Notes
- Uses Amazon Prime Video’s production API  
- Cookies or hardcoded auth values may be needed for requests  
- Playback is not included, only metadata display

<img width="500" height="700" alt="simulator_screenshot_C6BEA4EA-BEAF-436D-B500-5932A0F44382" src="https://github.com/user-attachments/assets/37d060ae-c8b1-4679-a729-8482b47c453b" />
<img width="300" height="800" alt="simulator_screenshot_F3A13CDB-E605-497C-9E32-A553221F4601" src="https://github.com/user-attachments/assets/00212d06-07e4-4a69-b379-bf73f13fe6f5" />


