# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

class Vela < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.23.1'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 'b79769e9e4a6e527dd8ec4c9ebac6c0cf9672a497da99a1e1658a6fbd026b345'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '74004b396a6dff3ad16956d73dce6a7a092cb96ebac9fb8919f8636a1af09ec2'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '7f2c610ae1ae4517df06d4d8c7d7ac65bbf459db2e39e1d353c5c6b140f22b29'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '862e5280243c27c767ec3b99e54c1ca734a88f37504671910c7d4022bd77d262'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '35da31056ce1fce1ed24af6ca59883ddc59ee4608b276f36e757fb6e9adc456a'
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
