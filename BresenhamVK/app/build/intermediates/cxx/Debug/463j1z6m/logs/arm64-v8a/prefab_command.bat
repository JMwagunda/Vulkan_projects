@echo off
"C:\\Program Files\\Android\\Android Studio\\jbr\\bin\\java" ^
  --class-path ^
  "C:\\Users\\Administrator\\.gradle\\caches\\modules-2\\files-2.1\\com.google.prefab\\cli\\2.0.0\\f2702b5ca13df54e3ca92f29d6b403fb6285d8df\\cli-2.0.0-all.jar" ^
  com.google.prefab.cli.AppKt ^
  --build-system ^
  cmake ^
  --platform ^
  android ^
  --abi ^
  arm64-v8a ^
  --os-version ^
  30 ^
  --stl ^
  c++_shared ^
  --ndk-version ^
  25 ^
  --output ^
  "C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\agp-prefab-staging14260461379769515287\\staged-cli-output" ^
  "C:\\Users\\Administrator\\.gradle\\caches\\transforms-3\\c68d7737bd65d165a05d189be0b05b14\\transformed\\jetified-games-activity-2.1.0-alpha01\\prefab"
