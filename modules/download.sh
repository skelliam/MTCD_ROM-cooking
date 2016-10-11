# check if already a ROM is in place. Download JY ROM from Google Drive

URL="https://doc-0c-7o-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/b36fpn5jv5qf7rcieakbs4poqljp7b8g/1476201600000/05419585178365164922/*/0BzxkkrRwpR3Ea0oxTHRXb0Uwb0U?e=download"

if [ ! -f $WORKDIR/orig_image/dupdate.img ]; then

        dialog --title "No image found" \--yesno "No dupdate.img file in working folder found as source. Should I download the latest one from da_anton's Google Drive?" 7 60

        response=$?
        case $response in
        0) echo "Downloading and unzipping in background. Please wait as file is around 500MB!!!"
           wget -O $WORKDIR/orig_image/current_version.img.zip "$URL"
           unzip $WORKDIR/orig_image/current_version.img.zip
           mv $WORKDIR/orig_image/current_version.img $WORKDIR/orig_image/dupdate-img
           rm $WORKDIR/orig_image/current_version.img.zip
        ;;
        1) functClean & exit;;

        255) functClean & exit;;
        esac
fi