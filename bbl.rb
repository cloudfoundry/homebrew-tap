class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v3.1.0"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "cb9d2e3d0bd09ccdcff9bbd7bbc2f204ffae8464b114a376d2eab2e08921ad94"

  depends_on :arch => :x86_64
  depends_on :terraform => "0.9.1+"
  depends_on "cloudfoundry/tap/bosh-cli"

  def install
    binary_name = "bbl"
    bin.install "bbl-#{version}_osx" => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
