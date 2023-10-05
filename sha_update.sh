#!/usr/bin/env bash

function sha_update() {
  local VELA_VERSION=$1
  local CHECKSUMS_PATH=$2

  local HEADER="# Copyright (c) 2023 Target Brands, Inc. All rights reserved.\n#\n# Use of this source code is governed by the LICENSE file in this repository.\n"

  local LINUX_AMD64=$(cat $CHECKSUMS_PATH | grep linux_amd64 | awk '{ print $1 }')
  local LINUX_ARM64=$(cat $CHECKSUMS_PATH | grep linux_arm64 | awk '{ print $1 }')
  local LINUX_ARM=$(cat $CHECKSUMS_PATH | grep linux_arm.tar | awk '{ print $1 }')
  local DARWIN_AMD64=$(cat $CHECKSUMS_PATH | grep darwin_amd64 | awk '{ print $1 }')
  local DARWIN_ARM64=$(cat $CHECKSUMS_PATH | grep darwin_arm64 | awk '{ print $1 }')

  echo -e $HEADER > Formula/vela.rb

  sed "s/VELA_VERSION/$VELA_VERSION/g" template.rb >> tmp.rb

  sed -i -e "s/DARWIN_ARM64_SHA/$DARWIN_ARM64/g" tmp.rb
  sed -i -e "s/DARWIN_AMD64_SHA/$DARWIN_AMD64/g" tmp.rb
  sed -i -e "s/LINUX_ARM64_SHA/$LINUX_ARM64/g" tmp.rb
  sed -i -e "s/LINUX_ARM_SHA/$LINUX_ARM/g" tmp.rb
  sed -i -e "s/LINUX_AMD64_SHA/$LINUX_AMD64/g" tmp.rb

  rm tmp.rb-e

  cat tmp.rb >> Formula/vela.rb

  local DIRECT_PATH=$(echo $VELA_VERSION | sed "s/v//g" | awk -F '\.' '{print $1"."$2}' )

  local TARGET_VER=$(echo $VELA_VERSION | sed "s/v//g" | awk -F '\.' '{print $1$2}')

  echo -e $HEADER > Formula/vela@$DIRECT_PATH.rb

  echo -e "require 'formula'" >> Formula/vela@$DIRECT_PATH.rb

  echo -e "\nclass VelaAT$TARGET_VER < Formula" >> Formula/vela@$DIRECT_PATH.rb

  sed '1d' tmp.rb >> Formula/vela@$DIRECT_PATH.rb

  rm tmp.rb
}

function main() {
  local VELA_VERSION=$1
  local CHECKSUMS_PATH=$2

  sha_update "$VELA_VERSION" "$CHECKSUMS_PATH"
}

main "$@"