# sync-images


## usage
Update images you wanted to sync in `images.txt` in format of `${origin_image}=>${target_image}`, 
after that just add、commit、push the changes, and then the images will be synced to target registry automatically.
If you don't want to sync some images, just comment them by add prefix `#` in front of line in `images.txt`.