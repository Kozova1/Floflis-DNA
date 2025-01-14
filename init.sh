#!/bin/sh

ok="Ok, going to the next question."
invalid="Please enter a valid input"

read -r -d '' dna_ascii << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
echo "${dna_ascii}"

echo "Welcome! Before adding that folder (Floflis DNA) to your device, we need to configure the install, to make it more lightweight."
echo ""
echo "We will ask some questions and configure according to your answers. Please reply by typing y/n (according to your choice) and press [ENTER]."

echo "${dna_ascii}"

echo "The first question. Do you want to update Floflis DNA from git (GitLab, GitHub) or manually? (P2P updates aren't supported, yet)"
echo "Installing without git makes it lightweight (ideal for routers and other limited devices), but will require manual effort like you're doing now."
echo "Update module and .git folder haves approx. 349.2 KB of disk usage."
echo "Do you want to use git to update Floflis? (Alternative is a manual update)"
echo "[Y/n]"
while true; do
read gitormanual

case gitormanual in
   [nN])
      echo "Removing .git folder..."
      sudo rm -r .git
      echo "Removing update module..."
      sudo rm modules/update
      echo "${ok}"
      break ;;
   
   [yY])
       echo "${ok}"
       break ;;
   *)
       echo "${invalid}" ;;
esac
done
echo "${dna_ascii}"

echo "Do you know how to turn off/restart/suspend Linux?"
echo "You can have the convenience to do it with 'floflis shu/sus/res' commands."
echo "But, if you don't want the 1,5 KB of the Floflis' energy module and knows how to do it from Linux:"
echo ""
echo "Use energy module? [Y/n]"
while true; do
read keepenergymod
case $keepenergymod in
   [nN])
       echo "Removing energy module..."
       rm modules/energy
       echo "${ok}"
       break ;;
   [yY])
       echo "${ok}" ;;
   *)
       echo "${invalid}";;
esac
done
echo "${dna_ascii}"

echo "Floflis DNA contains README.md, LICENSE, CONTRIBUTING, DISCLAIMER and CODE_OF_CONDUCT."
echo "Do you want to remove them? Due to responsibility, we will show LICENSE and DISCLAIMER and ask you to confirm your agreement."
echo "Do you want the documentation?"
echo "Documentation and information-reader module haves approx. 6.6 KB of disk usage."
echo "Keep documentation? [Y/n]"
read keepdocumentation

# if [ "$keepdocumentation" = "y" ]; then # No reason to keep this, doesnt do anything useful.
#   echo "${ok}"
# fi
echo "${dna_ascii}"
echo "License with disclaimer:" && echo ""
cat LICENSE && echo ""
echo "${dna_ascii}"

echo "Before removing documentation..."
echo "Do you agree with the license and the disclaimer? Please scroll up to read."
echo "PLEASE READ AND WRITE CAREFULLY!"
echo "Do you agree to the license? [Y/n]"
while true; do
read licenseagreement
case $licenseagreement in
   [nN])
      echo "You need to agree to the license in order to use Floflis!"
      exit;;
   [yY])
      echo "Removing README.md" && rm README.md
      echo "Removing LICENSE file" && rm LICENSE
      echo "Removing CONTRIBUTING file" && rm CONTRIBUTING
      echo "Removing DISCLAIMER file" && rm DISCLAIMER
      echo "Removing CODE_OF_CONDUCT.md" && rm CODE_OF_CONDUCT.md
      echo "Removing information-reader module" && rm modules/information-reader
      break ;;
   *)
      echo "${invalid}" ;;
esac
done
   
echo "${dna_ascii}"

echo "Done! Now, you can move this folder to the device you want to install Floflis, and run install.sh using 'sudo chmod +x install.sh && sudo ./install.sh' command (without quotes)."
# rm init.sh # Usually, wizards like this one should not remove themselves.
