class BoshCli < Formula
  desc "The new golang BOSH cli (alpha)"
  version "0.0.104"
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
  sha256 "7090028e733cd8873e05c2fc8f5debc7dc53d478828bd611390e484e75afb5e4"

  depends_on :arch => :x86_64

  def install
    bin.install "bosh-cli-#{version}-darwin-amd64" => "gosh"
  end

  test do
    system "#{bin}/bosh"
  end
end
