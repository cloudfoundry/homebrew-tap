require 'formula'

class Cf7Cli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0-beta.24'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.0.0-beta.24.tgz'
    sha256 '35261cb8a454d8e815f8d8b349728604ac5b04425938c7dbee4c833b1bcfded6'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0-beta.24&source=homebrew'
    sha256 'e8272297d1f3b0c2235e30ed44114d3d1e9543c8be24b54d64949351723769e0'
  end

  depends_on :arch => :x86_64

  def install
    bin.install 'cf7'
    (bash_completion/"cf7-cli").write <<-completion
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
complete -F _cf-cli cf7
    completion
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf7"
  end
end
