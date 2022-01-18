# Copyright (c) 2022 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

class Vela < Formula
  # repository information
  head "https://github.com/go-vela/cli.git"
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.11.0'
  
  # macOS
  on_macos do
    if Hardware::CPU.arm?
      url "#{homepage}/releases/download/#{version}/vela_darwin_arm64.tar.gz"
      sha256 '4318aa502c676ba09c8febd3cc7e890ac3b8db47542e1ae39d30902aa0af9219'
    else
      url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
      sha256 'a6addfa556c627b3c5a950df536d8c210dd707e1b8bcd8265ed3684f53b45ae0'
    end
  end
    
  # linux
  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "#{homepage}/releases/download/#{version}/vela_linux_arm64.tar.gz"
        sha256 '60c592836f8b0d0b33278045b0d7c8065f9c60226cd577b1857887436fafb523'
      else
        url "#{homepage}/releases/download/#{version}/vela_linux_arm.tar.gz"
        sha256 '50d1ae2e24117c3785d45215a67606ad927efe9021aea7559ca29e406a2427d1'
      end
    else
      url "#{homepage}/releases/download/#{version}/vela_linux_amd64.tar.gz"
      sha256 '1ef07b0dacb05eb889b731a30d25d7e06d61cd6151784d625683c87d12239f0e'
    end
  end
  
  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", "--version"
  end
end
