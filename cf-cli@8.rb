require 'formula'

class CfCliAT8 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '8.4.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.4.0'
      sha256 '156261838e3e65d52b5d9eea3f2c53113a6bab05349494cd8f0f7d6e06398e29'
    elsif
      url 'https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.4.0'
      sha256 'a0e70eb848c4526eb4e4a2b32b71b2746a9e8e2fba9e62e5ccb33d94ddab4904'
    end
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.4.0&source=homebrew'
    sha256 'a104a06e2b4ab6b9c7d28b625274e44ec48c2b9b27a7ccca4db50b570a007310'
  end

  def install
    bin.install 'cf8'
    bin.install_symlink 'cf8' => 'cf'
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
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf8"
  end
end
