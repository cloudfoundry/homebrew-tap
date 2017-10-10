class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v5.1.0"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "4699e5176c02b3301059a14b73c825f399bf22cb3b011000fe97629ff8195ea6"

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
