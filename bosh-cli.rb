class BoshCli < Formula
  desc "The new golang BOSH cli (alpha)"
  version "0.0.67"
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
  sha256 "85d36305c3d9529a8e4756bdf28dfd3c089c787b331ad8afdb673752107e2f8f"

  depends_on :arch => :x86_64

  def install
    bin.install "bosh-cli-#{version}-darwin-amd64" => "gosh"
  end

  test do
    system "#{bin}/bosh"
  end
end
