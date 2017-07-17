class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v3.2.6"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "92a2d392f8ea11f722d514eb644465b1c68db60769bf524a6ee7c6f05cf42b5d"

  depends_on :arch => :x86_64
  depends_on "terraform" => "0.9.8"
  depends_on "cloudfoundry/tap/bosh-cli"

  def install
    binary_name = "bbl"
    bin.install "bbl-#{version}_osx" => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
