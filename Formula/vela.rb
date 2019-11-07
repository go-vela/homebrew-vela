# Copyright (c) 2019 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class Vela < Formula
  # repository information
  head "https://github.com/go-vela/cli.git"
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.1.0'
  url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
  sha256 '1e9e733d9626fe657cd7b13e4479e8f7f3bd3cda7acf9ddb9ff988610e0172a5'

  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", "--version"
  end
end
