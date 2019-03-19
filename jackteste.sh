#JACK Test
echo -e "\nJack Settings Tweak.\nThe values must be 2."
grep "jack.server.max-service=" $HOME/.jack-server/config.properties && grep "SERVER_NB_COMPILE=" ~/.jack-settings
read -p "Press enter to continue..."

