# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

class Vela < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.20.0'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '87321bf8d17c8d1199055e345ab1932ea0eff43ae2c0ba5b02f96552f782d22a'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '0f6055ef3df294600416afb1cb0b97f45ae2334273db76d985b542f43655400e'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '0ad0de8b37f8e09c3ec597ee05e6da865c7f6795a56f552fdcc6258725856367'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '1d74489dada8bc761d1806b2e5fe3b0750451e9fe2504477129c45c974290426'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '9bcd0ed564f22e7415c63c0f1483ff7eda66739f67ee6bca510ebcf661af6b7c'
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
