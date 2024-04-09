class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.99.99"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/pivotal-cf/cli-dev/releases/download/v8.99.99/cf{VERSION_MAJOR}-cli-installer_8.99.99_macosarm.pkg"
      # url "/homebrew?arch=macosarm&version=8.99.99"
      sha256 "31c793070fb00f571c34827dcb8cc430c0e87a22ecc8eda5d2585e581fd0c8da"
    elsif
      url "https://github.com/pivotal-cf/cli-dev/releases/download/v8.99.99/cf8-cli-installer_8.99.99_osx.pkg"
      # url "/homebrew?arch=macosx64&version=8.99.99"
      sha256 "0ccb9dcd6eebf921929023315bb49df3a416e83af0c4c91c638df623952fdc26"
    end
  elsif OS.linux?
    url "https://github.com/pivotal-cf/cli-dev/releases/download/v8.99.99/cf8-cli_8.99.99_linux_x86-64.tgz"
    # url "/stable?release=linux64-binary&version=8.99.99&source=homebrew"
    sha256 "4a1479194e94cec044f8cb6a9e959acf1f77d729b14cc58053bc1b25e2ea329e"
  end

  def install
    bin.install "cf8"
    bin.install_symlink "cf8" => "cf"
    (bash_completion/"cf8-cli").write <<-completion

    completion
    doc.install "LICENSE"
    doc.install "NOTICE"
  end

  test do
    system "#{bin}/cf8"
  end
end
