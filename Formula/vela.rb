# Copyright (c) 2019 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class Vela < Formula
  # repository information
  head "https://github.com/go-vela/cli.git"
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.1.4'
  url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
  sha256 'a0f18c486b824112e93dd848ea483d63141eb08a9d3b6f748646e70b5eca10e9'

  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", "--version"
  end
end
