# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

class VelaRc < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.25.0-rc2'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '57a04d8ab6119714d070db938fe6de6ab14e312a81bd7ddef143e1bd623c8f2a'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '0d058c8db9e02a64eeaca9bdfae08313a0d18d2079b1e92582c3227c27928632'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '995a15416ece23ab794011b956df8f8f4cc6e6daf98354c40de8508a655c0c25'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '66d4e25e2d634be113d9d967bfaed2ada1048f6397473c9dcb5fb7383cf1f7e1'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '95d0e89731fb957ad961b143117d96dc9119fc0c593628228f56a314d26e5bc0'
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
