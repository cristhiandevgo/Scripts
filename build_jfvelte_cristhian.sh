#!/bin/bash
################
#  JACK TWEAKS #
################
#./prebuilts/sdk/tools/jack-admin kill-server
#./prebuilts/sdk/tools/jack-admin start-server
cd ..
cd android/lineage
source ~/.bashrc
source ~/.profile

#CCACHE
export CCACHE_DIR=/media/cristhian/Arquivos/.ccache
export USE_CCACHE=1
export CCACHE_DIR=/media/cristhian/Arquivos/.ccache
export ANDROID_CCACHE_SIZE="75G"
ccache -M 75G
prebuilts/misc/linux-x86/ccache/ccache -M 75G
/media/cristhian/Arquivos/android/lineage/prebuilts/misc/linux-x86/ccache/ccache -M 75G
#export _JAVA_OPTIONS="-Xmx3g"
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3G"
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3g"
#export PATH="$HOME/bin:$PATH"
export WITH_SU=false

read -p "Make clean? (yes): " CLEAN
read -p "Repo sync? (yes): " REPOSYNC
read -p "Make platform-res? (yes): " PLATFORM

if [ "$CLEAN" = "yes" ]
then
	echo "Cleaning...";
	make clean && make installclean
fi

#cd .repo/local_manifests
#wget -O roomservice.xml https://raw.githubusercontent.com/cristhiandevgo/local_manifests/lineage-15.1/jfvelte.xml
#cd ../..

if [ "$REPOSYNC" = "yes" ]
then
	echo "Syncing...";
	repo sync -c --force-sync --no-clone-bundle --no-tags
fi

#JACK Test
echo -e "\nJack Settings Tweak.\nThe values must be 2."
grep "jack.server.max-service=" $HOME/.jack-server/config.properties && grep "SERVER_NB_COMPILE=" ~/.jack-settings
read -p "Press enter to continue..."

#CCACHE
export CCACHE_DIR=/media/cristhian/Arquivos/.ccache
export USE_CCACHE=1
export CCACHE_DIR=/media/cristhian/Arquivos/.ccache
export ANDROID_CCACHE_SIZE="75G"
ccache -M 75G
/media/cristhian/Arquivos/android/lineage/prebuilts/misc/linux-x86/ccache/ccache -M 75G
prebuilts/misc/linux-x86/ccache/ccache -M 75G

cd device/samsung/jfve-common/patches
./apply.sh
cd ../../../../prebuilts/sdk/tools
./jack-admin kill-server
cd ../../..
. build/envsetup.sh
prebuilts/misc/linux-x86/ccache/ccache -M 75G

if [ "$PLATFORM" = "yes" ]
then
	echo "Building platform-res...";
	make org.lineageos.platform-res
fi
brunch jfvelte
cd prebuilts/sdk/tools
./jack-admin kill-server
cd ../../../device/samsung/jfve-common/patches
./revert.sh
cd

read -p "Build concluida, abrir pasta? (yes)" ABRIRBUILD

if [ "$ABRIRBUILD" = "yes" ]
then
	pcmanfm /media/cristhian/Arquivos/android/lineage/out/target/product/jfvelte/
fi
