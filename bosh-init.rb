class BoshInit < Formula
  desc "Creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{version}-darwin-amd64"
  version "0.0.99"
  sha256 "3a2f63493ecede7b9d99d46ffd0c99d5c40edd44db6ddd97ffcc52c56b4ebb89"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-#{version}-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
