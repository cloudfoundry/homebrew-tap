class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v3.2.3"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "a2a18d0e835125396bcb72aee236993b6cd36638f79b789eca8accdd1fac93b5"

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
