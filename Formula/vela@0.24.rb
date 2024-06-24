# Copyright (c) 2023 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT024 < Formula
  # repository information
  head 'https://github.com/go-vela/cli.git'
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.24.0'

  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 'ab3a8331fe334f2f2190d6dfc1d28df40addb764cf5bfc817976f7c68e9520ff'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 'd75331f9c74dbbbd67d531807fd2d885dab7de05fbd462a6bf0229a5e2aa7a32'
    end
  end

  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '4b21249f99f26626c6aa1fc1632905a3abe531b2d8a1687c40bf3d5852ed3f0f'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '775fd079caa9914bbaddb48267bde61b35b609a7d8129912803e5c6dcc3f2165'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '7022c8732873a8c6e9303a431fbaf1d25e60ae01c2b5a740383f4379c9f37b25'
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
