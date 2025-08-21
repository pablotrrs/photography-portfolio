@echo off
echo Resizing images with ImageMagick...

:: Create directories if they don't exist
if not exist "images\fulls" mkdir "images\fulls"
if not exist "images\thumbs" mkdir "images\thumbs"

:: Process all image files in the images directory
for %%f in (images\*.jpg images\*.jpeg images\*.png images\*.JPG images\*.JPEG images\*.PNG) do (
    echo Processing %%f...
    
    :: Create full-size version (1024px wide)
    magick "%%f" -resize 1024x "images\fulls\%%~nxf"
    
    :: Create thumbnail version (512px wide)
    magick "%%f" -resize 512x "images\thumbs\%%~nxf"
)

:: Clean up original files from images root
for %%f in (images\*.jpg images\*.jpeg images\*.png images\*.JPG images\*.JPEG images\*.PNG) do (
    echo Removing original %%f...
    del "%%f"
)

echo Done! All images have been resized.
pause
