
# Copyright (c) 2021 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT09 < Formula
  # repository information
  head "https://github.com/go-vela/cli.git"
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.10.2'
  
  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '29c93600dd09975c30e67bc6134627f206fd543b6d1edfc397e9af090a818870'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '4c2d467769b61ed16e930c9ed036422a68e60cc5e406a112d9598f29036d42d1'
  end
    
  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '5e793ec30155dbe29df3c6822018f6e812e243c219f0dc14371106044919eae4'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '22d7a12b819a195f674b26d81fa4d415da0b63457fe0f4edb35b1a4523b07dd6'
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '295b40efcf0dd3f602bd562734ea2657edbb4a1bd0a88a532bacab7e343a13ed'
  end

  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", "--version"
  end
end
