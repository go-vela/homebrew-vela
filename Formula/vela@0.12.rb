# Copyright (c) 2022 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT012 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.12.1'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 'd2858b16c9532fd96d1d81fdca2f41780a08d44a016a06dc185499b3a1b4e8e5'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '3cb6f96cecfd039244c00acba6d6e0d755b17d680c34c4265eb26f1c4764eb00'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 'da8f0eb9f4fd4d76d7e433c0aec07ad02a51c6ffc42addaff89ba82d34a20522'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '4f50ec9cdf83b00097ba175ea03c15e15236c5ca569d75ac43e3affd93a880d6'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '5dc3673ad11b5fdff50b51d1ae493d4b1deb3a313b645603eefa3721f84bedf7'
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
