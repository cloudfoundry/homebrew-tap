class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v3.2.0"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "e4a573436cffc7d54960d8e6366f2ecdc8cfa492fee768079b065c85681cf4a7"

  depends_on :arch => :x86_64
  depends_on "terraform" => "0.9.4"
  depends_on "cloudfoundry/tap/bosh-cli"

  def install
    binary_name = "bbl"
    bin.install "bbl-#{version}_osx" => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
