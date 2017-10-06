class BoshInit < Formula
  desc "creates and updates the Director VM"
  homepage "https://github.com/cloudfoundry/bosh-init"
  version "0.0.99"
  if OS.mac?
    url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{version}-darwin-amd64"
    sha256 "3a2f63493ecede7b9d99d46ffd0c99d5c40edd44db6ddd97ffcc52c56b4ebb89"
  elsif OS.linux?
    url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{version}-linux-amd64"
    sha256 "e72831813e1c020e5087d6c05a11dd638e628ad9315442d7d235db4d59d6e5ea"
  end

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/bosh-init", :because => "the Pivotal tap ships an older bosh-init version and is outdated"

  def install
    if OS.mac?
      bin.install "bosh-init-#{version}-darwin-amd64" => "bosh-init"
    elsif OS.linux?
      bin.install "bosh-init-#{version}-linux-amd64" => "bosh-init"
    end
  end

  test do
    system "#{bin}/bosh-init"
  end
end
