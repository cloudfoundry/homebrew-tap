class Concourse < Formula
  desc "Pipeline-based CI system"
  homepage "https://concourse.ci"
  url "https://github.com/concourse/concourse/releases/download/v3.3.0/concourse_darwin_amd64"
  sha256 "ebb0e79f3b3049901465b83ed695a867a727d8a72826c04e29fe77ad5ad67965"

  def install
    bin.install "concourse_darwin_amd64" => "concourse"
  end

  test do
    system "#{bin}/concourse", "--version"
  end
end
