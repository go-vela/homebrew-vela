# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT020 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.20.1'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '74a8783c3ee42736e2c4c31c76b725abb483ad27d6da0b797b2bb2c9b30e8cb9'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 'e99f6e377b56bcab62d2b7e9a2bfb0fd24b40abc68cbc4fca17114612761bf99'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 'ab6dbeb11c540c0e3f40ff47c3cf996d002d2e80babef91aab7d7041cff33f21'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '1381120810cee2e4a7985c811d28bd597b8ced6023929b48ac5cb0746bc82fb9'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '6e6afc79810f85ef62386f13c8d1a57abe61a94bab9cf3f4d09c4cff48fcffc6'
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