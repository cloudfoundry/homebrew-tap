class BoshCli < Formula
  desc "New BOSH CLI (beta)"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "0.0.149"
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
  sha256 "b114afa7ac2e60196b890447e01a3d58c29bee48072c0a21e8abc6de5150eaab"

  depends_on :arch => :x86_64

  def install
    bin.install "bosh-cli-#{version}-darwin-amd64" => "gosh"
  end

  test do
    system "#{bin}/gosh --help"
  end
end
