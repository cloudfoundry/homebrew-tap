class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v3.2.1"
  url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
  sha256 "8c71bc2bb43a58232a644fc2f26768942c5d17f0fe1e904871d73c7c1b5baa44"

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
