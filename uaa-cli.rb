class UaaCli < Formula
  desc "CLI for UAA written in golang"
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"
  version "0.1.0"
  url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/0.10.0/uaa-darwin-amd64-0.10.0"
  sha256 "482cd886a2abd60678c292b126e4c869c1305a610fbe8d05a78207e22edeff88"

  depends_on :arch => :x86_64

  def install
    bin.install "uaa-darwin-amd64-#{version}" => "uaa"
  end

  test do
    system "#{bin}/uaa"
  end
end
