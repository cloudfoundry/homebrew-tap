class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  version "0.0.96"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{version}-darwin-amd64"
  sha256 "cb5f279f2ee19d9de1f54f041c0c2494878dbdf17b972251a8c391a3c2d7b982"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-#{version}-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
