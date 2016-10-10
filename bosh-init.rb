class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  version "0.0.97"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{version}-darwin-amd64"
  sha256 "3b2d18265f2384cc907bd4b75cb27a2af3e29d23cc3ca221ee10ba21c020be19"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-#{version}-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
