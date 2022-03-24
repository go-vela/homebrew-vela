# Copyright (c) 2022 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT013 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.13.0'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '1699ab8304dcb49cba6522e48ee472a7d5952dd4ae68b0e800c760980eca3ef6'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 'ecdde72501b52edecbaa5b4ce5f7e9652e76fd42d344d900c76da32325517d34'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '91eeac33663dc62252c5a275dc0aa96f020833fc031d5b3fdd34f56f9d08ad37'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 'e8417d3e2cd154c445d618ca4fba17e73d3bdf8f41d3d6e639c8228b0ebd7a6a'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '7a2dc79963b64c5d8853f1d4c3c1136c5f9b35686131dee901478f1899fcffea'
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
