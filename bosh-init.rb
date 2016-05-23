class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.91-darwin-amd64"
  version "0.0.91"
  sha256 "cec1a1d48d78905f13d3360af75aab1c12e8fecc00c6fa96d942d7898a0ab4e6"

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    bin.install "bosh-init-0.0.91-darwin-amd64" => "bosh-init"
  end

  test do
    system "#{bin}/bosh-init"
  end
end
