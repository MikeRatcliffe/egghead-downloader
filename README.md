# Egghead.io video downloader

If you have a pro account with egghead.io you can download a HD video series for later viewing.

Update `.env` with your email and password and run the script with the url of a video series e.g.

```bash
npm install
npm run download https://egghead.io/series/getting-started-with-redux
```

If you have VLC installed you can play the series from the terminal e.g.

```bash
vlc "videos/getting-started-with-redux"
```

## How to use
**To scrap the list of topics available in Egghead**
```
npm run scrap-topics
```

**To download an specific course**
```
npm run download URL_COURSE
```
Example:
```
npm run download https://egghead.io/series/getting-started-with-redux
```

**To scrap the list of ALL courses available of one specific topic**
```
npm run scrap-course TOPIC
```
Example:
```
npm run scrap-course angular
``` 

**To download a list of courses in one go**
```
npm run download FILE_URLS_COURSES
```
Example:
```
npm run download-bulk file.txt
```
