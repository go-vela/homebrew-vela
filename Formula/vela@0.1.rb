# Copyright (c) 2019 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT01 < Formula
  # repository information
  head "https://github.com/go-vela/cli.git"
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.1.3'
  url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
  sha256 'b8998488ae0641ed9e7c64e78c26239bca241901f29145623ddcbdff097a4c5a'

  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", "--version"
  end
end
