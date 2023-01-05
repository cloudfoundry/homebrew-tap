class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.10"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.10/credhub-darwin-2.9.10.tgz"
    sha256 "ccaa6c09ad4ca15ccad031ed53c54c924d10c8ced3d43b330b8e2a228e706f62"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.10/credhub-linux-2.9.10.tgz"
    sha256 "e1719d406f947f29b150b73db508c96afffb3b95f01f5031140c705b885b8a38"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
