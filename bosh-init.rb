class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.81-darwin-amd64"
  version "0.0.81"
  sha256 "9f7cd40587fceabf9d7c62d79360b4fc490b1b6ef3bebe6ce9b4f729cdd42d3e"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-0.0.81-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
