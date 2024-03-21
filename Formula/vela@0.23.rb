# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT023 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.23.3'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '6254f4760605c0a369043e6f037a2669b06d2ad6c159d41ce5193363b9a6ba67'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '9f40d95ee6c9de37053b01efebb67c427627be49ed6291e7d7144ebd1a7210fa'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '5b4b7c2c117429f4bf7b3de4b103c5a010ff8bcc445986d82b452f16bcb6745d'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '324db424881cff3ea0766b0a37a5e85ca9bcb8c38f2c159612076ef8f5099af0'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '6e0827d1abd5ebb7696e5d94b5e8e0a510f446ec5f8341575232903bda609ae2'
    end
  end

  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", '--version'
  end
end
