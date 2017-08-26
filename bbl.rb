class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v4.2.1"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "a266fec8bd48ce32c7dae49f5fee215d75e0de3adbba571e2e805167390277c1"

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
