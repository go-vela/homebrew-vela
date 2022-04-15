# Copyright (c) 2022 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

class Vela < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.13.1'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '1bca393b3c7d3ceb5f86ff30f619d247717d7f0c6a1ce30daa50b2d0e96e50b9'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 'ee34edd6c121c1792b08a148fe1dccb12491182a92d165720e30e643fc0d3d70'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 'a61d34bd4f5825da3393847a2c6cd8c993780e3d4f2e0553963fbdf3752eeb66'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '7a0460bd878de57246e6dbfde8adf03f4da1db6ada69c5c23c58abf31bd04d07'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '60ebbfaf507d4218b49c0d6343910e21de407640243672c11664381537862f8a'
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
