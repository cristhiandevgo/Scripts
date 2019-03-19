#!/bin/bash

echo "Seting up the enviroment..."

mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

##################
#  PROFILE SETUP #
##################

#echo '' >> ~/.profile
#echo '# set PATH so it includes users private bin if it exists' >> ~/.profile
#echo 'if [ -d "$HOME/bin" ] ; then' >> ~/.profile
#echo '    PATH="$HOME/bin:$PATH"' >> ~/.profile
#echo 'fi' >> ~/.profile

#################
#  BASHRC SETUP #
#################

#echo '' >> ~/.bashrc
#echo 'export USE_CCACHE=1' >> ~/.bashrc
#echo 'export ANDROID_CCACHE_SIZE="55.5G"' >> ~/.bashrc
#echo 'ccache -M 55.5G' >> ~/.bashrc
#echo 'export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3G"' >> ~/.bashrc
#echo 'export CCACHE_DIR=/media/cristhian/Arquivos/.ccache' >> ~/.bashrc

#CCACHE
export CCACHE_DIR=/media/cristhian/Arquivos/.ccache
export USE_CCACHE=1
export CCACHE_DIR=/media/cristhian/Arquivos/.ccache
export ANDROID_CCACHE_SIZE="75G"
/media/cristhian/Arquivos/android/lineage/prebuilts/misc/linux-x86/ccache/ccache -M 75G

#source ~/.profile

sudo apt-get install -y git ccache automake lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng maven

sudo apt-get install openjdk-8-jdk

echo "Testing PATH..."
echo $PATH$

##############
#  REPO INIT #
##############

#repo init -u https://github.com/LineageOS/android.git -b cm-14.1 --depth=1
#repo init -u https://github.com/LineageOS/android.git -b lineage-15.1 --depth=1
git config --global user.email cristhiandev91@gmail.com
git config --global user.name Cristhian
echo "Syncing..."
repo sync -c --force-sync --no-clone-bundle --no-tags

#JACK Test
#Necessário um repo sync antes de configurar os valores
echo -e "\nJack Settings Tweak.\nThe values must be 2."
grep "jack.server.max-service=" $HOME/.jack-server/config.properties && grep "SERVER_NB_COMPILE=" ~/.jack-settings
read -p "Press enter to continue..."

echo "Done!"
