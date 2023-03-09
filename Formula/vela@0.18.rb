# Copyright (c) 2022 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT018 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.18.1'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '4b72a2a50ce0e13f5a5342c06b16bef6c18be571de1e0f5c26c660b71efb4269'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 'b2088c1934232fea1c96d9ed7b027aa6c6ac7b2e32bf025f1f4adeaf21d3ef62'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 'c79ad623ca81cfd4597d0aa81ff48a69b4f3a435f07b41847ea95aa08937b5cd'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '9f0ae297ef16782e6749734e2ecb15acb9758b30b15908ca967ee7bc7f59708f'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 'd93d2aea04cbe914050b9662a22d7b5ebc48de545d7bf0baeaa7b81930ba6f15'
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
