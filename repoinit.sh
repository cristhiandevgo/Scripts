#!/bin/bash
repo init -u https://github.com/LineageOS/android.git -b lineage-15.1 --depth=1
repo sync -c --force-sync --no-clone-bundle --no-tags