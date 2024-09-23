# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

class VelaRc < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.25.0-rc1'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 'f0c242709427f2985f49e04226ae2f84ca1f997ccabb367d972c1b9d3e941c78'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '3b2b20c66ce6be8fa795ec2f3741e207d206e1dd397a637ed5945e1af990e030'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 'b4f1e7183b3bb05fda3d8f239a4b2161abc6646c2946d3d58c30ef81cc49e9f6'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '2a130b1b96f4ef3509884e8a1acf38855418db896fb1712bd6d6da6d44b33277'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 'e68e7aa56943f5d9ff12456e6989bea4ea5e8366ff4150f0ed3b62f335efa5b8'
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
