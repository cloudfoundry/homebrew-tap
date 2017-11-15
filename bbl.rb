class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v5.4.1"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "7e350faaa1c7369d6f13f904cdc557f11334c4f4ec177f9cc6e11d2f07c1a242"

  depends_on :arch => :x86_64
  depends_on "terraform" => "0.10.0"
  depends_on "cloudfoundry/tap/bosh-cli" => "2.0.29"

  def install
    binary_name = "bbl"
    bin.install "bbl-#{version}_osx" => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
