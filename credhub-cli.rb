class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.8.0"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.8.0/credhub-darwin-2.8.0.tgz"
    sha256 "ddc03e993e7a40a653c12af30c2aafb34cef41e4fed5ca804612e6b24658eb98"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.8.0/credhub-linux-2.8.0.tgz"
    sha256 "dcd4f05eaaea6f356d8ffcbf2692c465b272fcdf773266589f4bc4a891cbe4e4"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
