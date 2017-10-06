class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.4.1"
  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/#{version}/credhub-darwin-#{version}.tgz"
    sha256 "7da92f5fec350ff42d1d111a7cfc3d4c254cc086add48a470b6ed255c262b963"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/#{version}/credhub-linux-#{version}.tgz"
    sha256 "a9a70389919f3e16e4e0e925d59eb831ba18666a4272f209f6a740fc7a4d6a50"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
