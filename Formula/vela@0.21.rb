# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT021 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.21.0'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '229a32ede0736f8db775aaf768e8151f601c67824d9c8a663109e251a47f534d'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 'f299d513615df5913f55f6c288b9a8e167df98d46522dcd9646b9380731d5885'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '07be9f007379001879ad0c1fb8509a5f2b2ec99a20529c10ea0b02a43dd7d6ba'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '1f0c3613ade1e4a8b56a8cdc2beadf83f76efb59300fe5c83ce49308ded84988'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '9d3624aa478c5ecf610a14ec17894a7760ec5e015cbca3ae31c075a9f0e627d8'
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
