require 'formula'

class CfCliAT7 < Formula
  desc "The official command line client for Cloud Foundry (v7)"
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0-beta.30'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.0.0-beta.30.tgz'
    sha256 '859e08755ba43b22af28f81a2b21bd0aaec01883d60732c012c13c98f698ebe9'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0-beta.30&source=homebrew'
    sha256 '8b9dc187d4fa73dfc416df73737f5e2008b7dcc746d14fc891b54da8143dc7b2'
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
