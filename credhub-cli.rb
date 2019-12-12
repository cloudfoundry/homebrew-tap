class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.6.2"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.6.2/credhub-darwin-2.6.2.tgz"
    sha256 "a763d90ca4c9cfd894d0c726c7ab3131061c9002d8ba48ef3b87ac9b6b68c194"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.6.2/credhub-linux-2.6.2.tgz"
    sha256 "897b588d9236d520c4eabec794e6126254f607c506ce6ea77350b60ecfa5c1ce"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
