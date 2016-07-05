class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.95-darwin-amd64"
  version "0.0.95"
  sha256 "312b503bf545ef40cb72470392f9d356364a2c49441b24b1ec7f3bcdd48416a3"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-0.0.95-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
