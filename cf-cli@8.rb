class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.18.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.18.3"
      sha256 "f4bd3664ac2f4884ef294d14f8ead9d002c012b580bf694c343f71156f1ee4c7"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.18.3"
      sha256 "f201a4cf8fbdb723f848ba95a1cb0c0e9f7484ca44fc98e5643a359f6db4e154"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.18.3&source=homebrew"
    sha256 "8942e2c3c98e83c7e14edbce939876bba7ff12a26f0f722c5aa5b079d357d50b"
  end

  def install
    bin.install "cf8"
    bin.install_symlink "cf8" => "cf"
    (bash_completion/"cf8-cli").write <<-completion
# bash completion for Cloud Foundry CLI

_cf-cli() {
    # All arguments except the first one
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    # Only split on newlines
    local IFS=$'\n'
    # Call completion (note that the first element of COMP_WORDS is
    # the executable itself)
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}
complete -F _cf-cli cf8
complete -F _cf-cli cf
    completion
    doc.install "LICENSE"
    doc.install "NOTICE"
  end

  test do
    system "#{bin}/cf8"
  end
end
