class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.87-darwin-amd64"
  version "0.0.87"
  sha256 "f7516cfdc579695dbc19e1e34be2d75393cc850f97faf2fb42c14c817b11deef"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-0.0.87-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
