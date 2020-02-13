# Copyright (c) 2019 Target Brands, Inc. All rights reserved.
#
# Use of this source code is governed by the LICENSE file in this repository.

require 'formula'

class VelaAT03 < Formula
  # repository information
  head "https://github.com/go-vela/cli.git"
  homepage 'https://github.com/go-vela/cli'

  # utility information
  version 'v0.3.0-rc3'
  url "#{homepage}/releases/download/#{version}/vela_darwin_amd64.tar.gz"
  sha256 '9eabd70e687332417cb6e14e769232149e171f027ceb7731c468a62c90856711'

  # install information
  def install
    bin.install 'vela'
  end

  # test information
  test do
    system "#{bin}/vela", "--version"
  end
end
