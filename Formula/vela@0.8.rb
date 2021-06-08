# Copyright (c) 2021 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT08 < Formula
  # repository information
  head "https://github.com/go-vela/cli.git"
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.8.0'
  url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
  sha256 '8b0eba890b3e5d5329b2c743478bdae2e0048d2b0b9ea5fd772c3554676a23e0'

  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", "--version"
  end
end
