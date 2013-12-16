#!/bin/bash
path=/bin:/usr/bin
script=$(basename $0)
echo -e "Today's date is $(date)\n"
location=$(pwd)
echo "Current directory is $location"
echo -e 'List of files in current directory:\n'
echo $(ls)
recurse=$(ls -R)
PS3='Make choice '
options=( "Zip Update Unzip Search ListAll Quit" )
select opt in $options
do
 
if [ "$opt" = "Zip" ]; then
 
  read -p "File Location: (* if current directory): " file
  read -p "Destination Folder and name of tar file: " destination
  destination=${destination: -Testing}
  file=${file: -Testing}
  tar cvPf ./$destination.tar ./$file 
#Can adjust argument however update won't work on compressed files to best of knowledge 
elif [ "$opt" = "Update" ]; then
 
  read -p "File Location: " file
  read -p "Folder that you wish to use for update: " destination
  destination=${destination: -Testing}
  file=${file: -Testing}
  tar -uvf ./$file ./$destination  
 
elif [ "$opt" = "Search" ]; then
 
  read -p "Files to Search for: " file
  file=${file: -Testing}
  find i-name ./$file
#arguments can be adjusted as per your intention

  elif [ "$opt" = "ListAll" ]; then
oldifs=$IFS
IFS=$(echo -e '\n')
echo List of Files in current directory and subdirectories.
echo $recurse
IFS=oldifs

elif [ "$opt" = "Unzip" ]; then
read -p "File to be extracted: " file
  read -p "Destination Folder: " destination
  read -p "What files? " choice
  choice=${choice: -Testing}
  destination=${destination: -Testing}
  file=${file: -Testing}
  tar xvf ./$file -C ./$destination ./$choice

elif [ "$opt" = "Quit" ]; then
echo "Exiting Script. It's dead Jim!"
exit
clear
else
echo bad option
fi
 
done
