class BoshCli < Formula
  desc "New BOSH CLI (beta)"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "2.0.41"
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
  sha256 "609d1deb762d63cf68aef5cd1ea9ddc676ddc2add72892539e123015f5b54232"

  depends_on :arch => :x86_64

  option "with-bosh2", "Rename binary to 'bosh2'. Useful if the old Ruby CLI is needed."

  def install
    binary_name = build.with?("bosh2") ? "bosh2" : "bosh"
    bin.install "bosh-cli-#{version}-darwin-amd64" => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
