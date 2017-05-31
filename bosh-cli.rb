class BoshCli < Formula
  desc "New BOSH CLI (beta)"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "2.0.23"
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
  sha256 "33a30993727d37eb01420b92b979b9f8a6b9c1e4834154f430deeed1cd30ea8d"

  depends_on :arch => :x86_64

  option "without-bosh2", "Don't rename binary to 'bosh2'. Useful if the old Ruby CLI is not needed."

  def install
    binary_name = build.without?("bosh2") ? "bosh" : "bosh2"
    bin.install "bosh-cli-#{version}-darwin-amd64" => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
