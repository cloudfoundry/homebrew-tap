require 'formula'

class CfCliAT8 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '8.0.0'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf8-8.0.0.tgz'
    sha256 'f8210bb8d96a0c7a76f6ccdb183b8dd4756d6049c541253bb96cb0d5cbd57261'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.0.0&source=homebrew'
    sha256 'a929a214bd4acb1d7e4f9e7eaefb580ff38318dc6eb9a5e106256c8bad794d3f'
  end

  depends_on :arch => :x86_64

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
