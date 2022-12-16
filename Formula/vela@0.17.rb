# Copyright (c) 2022 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT017 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.17.0'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 'a3ffb82c79121f646a5fe9ea984ba423ba42f6c2f088a08b99ccf0f5a98fb76d'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 '493f57aefcf4819bbb944b495a8ad6fde250c3104de1bf7f9b5c9e0ac6f8fcbb'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 'a7f4ed2ff4b37a6d50a90a40026c2a13c69bb2ee6b28a1031fdc761de91395a4'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 'a574fd5d84a881174be6f9220c76f4e10487d116e7ed59b237d26f7af349f963'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 'd42c5763ecb38f1c0043945656616152828f61a6745d39eb5219751850a1c249'
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
