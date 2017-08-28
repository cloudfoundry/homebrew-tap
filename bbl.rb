class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v4.2.2"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "c9c80bfd2af628ff22aaa91bc4cf878dbd3412fe6150d5f911c803aa9a973bd0"

  depends_on :arch => :x86_64
  depends_on "terraform" => "0.10.2"
  depends_on "cloudfoundry/tap/bosh-cli" => "2.0.33"

  def install
    binary_name = "bbl"
    bin.install "bbl-#{version}_osx" => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
