class UaaCli < Formula
  desc "CLI for UAA written in Go"
  homepage "https://github.com/cloudfoundry/uaa-cli"
  version "0.20.1"
  url "https://github.com/cloudfoundry/uaa-cli/releases/download/v#{version}/uaa-darwin-amd64-#{version}"
  sha256 "5b2a7a757eec270fcc148268612207f816db253b45ffd4e7098f2409313e5971"

  def install
    opoo "This formula is deprecated. Please use 'brew install --cask cloudfoundry/tap/uaa-cli' instead."
    opoo "The cask provides newer versions and better installation experience."
    bin.install "uaa-darwin-amd64-#{version}" => "uaa"
  end

  test do
    system "#{bin}/uaa"
  end
end
