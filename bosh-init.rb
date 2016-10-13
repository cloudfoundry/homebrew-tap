class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  version "0.0.98"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{version}-darwin-amd64"
  sha256 "05f3b10c9adb78d45c367b902bec37e8379c5a044d45fde55d0a42b916a8eb40"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-#{version}-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
